package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class PmdDao {
	String dirver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static PmdDao instance;

	public static PmdDao getInstance() {
		if (instance == null) {
			instance = new PmdDao();
		}
		return instance;
	}

	private PmdDao() {
		// DBCP
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			System.out.println("conn:" + conn);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<PmdBean> getAllPmb() {

		ArrayList<PmdBean> lists = new ArrayList<PmdBean>();

		try {
			String sql = "select * from pmd order by pnum";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			lists = makeArrayList(rs);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return lists;

	}// getAllPmb

	public ArrayList<PmdBean> makeArrayList(ResultSet rs) throws SQLException {

		ArrayList<PmdBean> lists = new ArrayList<PmdBean>();

		while (rs.next()) {
			PmdBean pb = new PmdBean();
			pb.setPnum(rs.getInt("pnum"));
			pb.setPname(rs.getString("pname"));
			pb.setPcategory_fk(rs.getString("pcategory_fk"));
			pb.setPimage(rs.getString("pimage"));
			pb.setPqty(rs.getInt("pqty"));
			pb.setPrice(rs.getInt("price"));
			pb.setPcontents(rs.getString("pcontents"));
			pb.setPoint(rs.getInt("point"));

			lists.add(pb);

		}
		return lists;
	}// makeArrayList

	public int insertPmd(MultipartRequest multi) {

		int cnt = -1;

		try {
			String sql = "insert into pmd(pnum,pname,pcategory_fk,pimage,pqty,price,pcontents,point)"
					+ "values(mdseq.nextval,?,?,?,?,?,?,?)";

			ps = conn.prepareStatement(sql);
			ps.setString(1, multi.getParameter("pname"));
			ps.setString(2, multi.getParameter("pcategory_fk"));
			ps.setString(3, multi.getOriginalFileName("pimage"));
			ps.setString(4, multi.getParameter("pqty"));
			ps.setString(5, multi.getParameter("price"));
			ps.setString(6, multi.getParameter("pcontents"));
			ps.setString(7, multi.getParameter("point"));

			cnt = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;

	}

	public int DeletePmd(int pnum) {

		int cnt = -1;

		try {
			String sql = "delete from pmd where pnum =?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pnum);

			cnt = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;

	}// DeletePmd

	public PmdBean getPmdByNum(String pnum) {

		ArrayList<PmdBean> lists = new ArrayList<PmdBean>();

		try {
			String sql = "select * from pmd where pnum = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, pnum);
			rs = ps.executeQuery();

			lists = makeArrayList(rs);

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("getProductByPnum lists.size():" + lists.size());
		return lists.get(0);

	}// getPmdByNum

	public int updatePmd(MultipartRequest mr, String img) {

		int cnt = -1;

		try {
			String sql = "update pmd set pname=?,pimage=?, pqty=?, price=?, pcontents=?, point=? where pnum = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("pname"));
			ps.setString(2, mr.getOriginalFileName("pimage"));
			ps.setString(3, mr.getParameter("pqty"));
			ps.setString(4, mr.getParameter("price"));
			ps.setString(5, mr.getParameter("pcontents"));
			ps.setInt(6, Integer.parseInt(mr.getParameter("point")));
			ps.setString(7, mr.getParameter("pnum"));

			cnt = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;

	}// updatePmd

	public ArrayList<PmdBean> selectByCago(String code) {

		ArrayList<PmdBean> lists = new ArrayList<PmdBean>();

		try {
			String sql = "select * from pmd where pcategory_fk like ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, code + "%");
			rs = ps.executeQuery();

			lists = makeArrayList(rs);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return lists;
	}


}
