package my.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDao {
	String dirver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static MemberDao instance;

	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}

	private MemberDao() {
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
	}// MemberDao

	public MemberBean getLogin(String id, String password) {

		MemberBean mb = null;

		try {
			String sql = "select * from member where id = ? and password = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			rs = ps.executeQuery();

			if (rs.next()) {

				mb = getMemberBean(rs);
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
		return mb;

	}

	public int insertMember(MemberBean mb) {

		int cnt = -1;
		
		String sql = "insert into member values(memberseq.nextval,?,?,?,?,?,?,?)";
		try {

			ps = conn.prepareStatement(sql);
			ps.setString(1, mb.getId());
			ps.setString(2, mb.getPassword());
			ps.setString(3, mb.getEmail());
			ps.setString(4, mb.getBirth());
			ps.setString(5, mb.getName());
			ps.setString(6, mb.getTelecom());
			ps.setString(7, mb.getHphone());

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
		System.out.println("insertMember cnt:" + cnt);
		return cnt;

	}// insertMember

	public MemberBean findid(String name, String hphone) {

		MemberBean mb = null;

		try {
			String sql = "select * from member where name = ? and hphone =?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, hphone);
			rs = ps.executeQuery();

			if (rs.next()) {

				mb = getMemberBean(rs);
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
		return mb;

	}// findid

	public MemberBean getMemberBean(ResultSet rs) throws SQLException {

		MemberBean mb = new MemberBean();

		mb.setNum(rs.getInt("num"));
		mb.setId(rs.getString("id"));
		mb.setPassword(rs.getString("password"));
		mb.setEmail(rs.getString("email"));
		mb.setBirth(rs.getString("birth"));
		mb.setName(rs.getString("name"));
		mb.setTelecom(rs.getString("telecom"));
		mb.setHphone(rs.getString("hphone"));

		return mb;

	}// getMemberBean

	public MemberBean findpw(String id, String name, String hphone) {

		MemberBean mb = null;

		try {
			String sql = "select *from member where id =? and name = ? and hphone =?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, hphone);
			rs = ps.executeQuery();

			if (rs.next()) {

				mb = getMemberBean(rs);
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
		return mb;

	}

	public ArrayList<MemberBean> getAllMember() {

		ArrayList<MemberBean> lists = new ArrayList<MemberBean>();

		try {
			String sql = "select * from member order by num";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				MemberBean mb = new MemberBean();
				mb.setNum(rs.getInt("num"));
				mb.setId(rs.getString("id"));
				mb.setPassword(rs.getString("password"));
				mb.setEmail(rs.getString("email"));
				mb.setBirth(rs.getString("birth"));
				mb.setName(rs.getString("name"));
				mb.setTelecom(rs.getString("telecom"));
				mb.setHphone(rs.getString("hphone"));

				lists.add(mb);
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

	}
	
	public boolean searchId(String userid) {
		boolean flag = false;
		try {
		String sql = "select * from member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				flag = true;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}//searchId

}
