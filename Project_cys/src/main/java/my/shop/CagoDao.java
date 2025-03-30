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

public class CagoDao {
	String dirver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static CagoDao instance;

	public static CagoDao getInstance() {
		if (instance == null) {
			instance = new CagoDao();
		}
		return instance;
	}

	private CagoDao() {
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

	public ArrayList<CagoBean> getAlllist() {

		ArrayList<CagoBean> lists = new ArrayList<CagoBean>();

		try {
			String sql = "select * from cago order by cnum";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				CagoBean cb = new CagoBean();
				cb.setCnum(rs.getInt("cnum"));
				cb.setCode(rs.getString("code"));
				cb.setCname(rs.getString("cname"));

				lists.add(cb);
			}

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

	}// getAlllist

	public int insetCago(CagoBean cb) {

		int cnt = -1;

		try {
			String sql = "insert into cago values(cagoseq.nextval,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, cb.getCode());
			ps.setString(2, cb.getCname());

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

	}// insetCago

	public int DeleteCago(int cnum) {

		int cnt = -1;

		try {
			String sql = "delete from cago where cnum = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cnum);

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

	}

	public int UpdateCago(CagoBean cb) {

		int cnt = -1;

		try {
			String sql = "update cago set code= ?, cname = ?";
			ps = conn.prepareStatement(sql);

			ps.setString(1, cb.getCode());
			ps.setString(2, cb.getCname());

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

	public CagoBean getCagoByCnum(int cnum) {

		CagoBean cb = null;

		try {
			String sql = "select * from cago where cnum = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cnum);

			rs = ps.executeQuery();

			if (rs.next()) {
				cb = new CagoBean();
				cb.setCnum(rs.getInt("cnum"));
				cb.setCode(rs.getString("code"));
				cb.setCname(rs.getString("cname"));
			}

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
		return cb;

	}

}
