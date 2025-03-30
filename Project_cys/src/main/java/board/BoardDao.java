package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDao {
	// BoardDao 객체는 싱글톤 패턴으로 생성
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid = "sqlid";
	String dbpw = "sqlpw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static BoardDao instance;

	public static BoardDao getInstance() {

		if (instance == null) {
			instance = new BoardDao();
		}

		return instance;
	}

	public BoardDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbid, dbpw);
			System.out.println("드라이버 로드 성공");
			System.out.println("계정 연결");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int getArticleCount() { // 전체 레코드 갯수

		int cnt = 0;
		String sql = "select count(*) as cnt from board";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}

			} catch (SQLException e) {
				System.out.println("접속 종료");
				e.printStackTrace();
			}
		}
		return cnt;

	}// getArticleCount

	public ArrayList<BoardBean> getArticles(int start, int end) {

		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();

		String sql = "select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from board  ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while (rs.next()) {
				BoardBean bb = new BoardBean();

				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setEmail(rs.getString("email"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));

				lists.add(bb);
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

	}// getArticles

	public BoardBean getArticle(int num) {

		BoardBean bb = new BoardBean();
		try {
			String sql2 = "update board set readcount = readcount +1 where num = ?";

			ps = conn.prepareStatement(sql2);
			ps.setInt(1, num);
			ps.executeUpdate();

			String sql = "select * from board where num = ?";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();

			if (rs.next()) {
				bb.setNum(num);
				bb.setWriter(rs.getString("writer"));
				bb.setEmail(rs.getString("email"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
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
		return bb;
	}

	public int insertArticle(BoardBean bb) { // 5+2 원글쓰기

		int cnt = -1;
		String sql = "insert into board (num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip) "
				+ "values (board_seq.nextval, ?, ?, ?, ?, ?,  board_seq.currval, ?, ?, ?, ?)";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getEmail());
			ps.setString(3, bb.getSubject());
			ps.setString(4, bb.getPasswd());
			ps.setTimestamp(5, bb.getReg_date());
			ps.setInt(6, 0);
			ps.setInt(7, 0);
			ps.setString(8, bb.getContent());
			ps.setString(9, bb.getIp());

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

	}// insertArticle

	public int deleteArticle(int num, String passwd) { // 입력한 passwd

		String sql = "select passwd from board where num=?";
		String sql2 = "delete from board where num=?";
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if (rs.next()) {
				String dbpw = rs.getString("passwd");
				if (dbpw.equals(passwd)) {
					ps = conn.prepareStatement(sql2);
					ps.setInt(1, num);
					cnt = ps.executeUpdate();
				} else {
					cnt = 0;
				}
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

		return cnt;
	}// deleteArticle

	public int replyArticle(BoardBean bb) {// 5,3

		int cnt = -1;

		try {
			String sql = "update board set re_step = re_step + 1 where ref = ? and re_step >  ?";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, bb.getRef());
			ps.setInt(2, bb.getRe_step());

			String sql2 = "insert into board (num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip) "
					+ "values (board_seq.nextval, ?, ?, ?, ?, ? ,?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql2);
			rs = ps.executeQuery();

			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getSubject());
			ps.setString(3, bb.getEmail());
			ps.setString(4, bb.getContent());
			ps.setString(5, bb.getPasswd());
			ps.setInt(6, bb.getRef());
			ps.setInt(7, bb.getRe_step());
			ps.setInt(8, bb.getRe_level());
			ps.setString(9, bb.getContent());
			ps.setString(10, bb.getIp());

			cnt = ps.executeUpdate();

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
		return cnt;
	}

	public BoardBean updateGetArticle(int num) {
		BoardBean bb = new BoardBean();
		try {
			String sql = "select * from board where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if (rs.next()) {
				bb.setNum(num);
				bb.setWriter(rs.getString("writer"));
				bb.setEmail(rs.getString("email"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
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
		return bb;
	}// updateGetArticle

	public int updateArticle(BoardBean bb) { // 글번호, 비번(내가 입력한)
		int cnt = -1;
		PreparedStatement ps = null;

		String sql2 = "select passwd from board where num=?";
		String sql = "update board set writer = ?, subject = ?, email = ?, content = ? where num = ?";

		try {

			ps = conn.prepareStatement(sql2);
			ps.setInt(1, bb.getNum());
			rs = ps.executeQuery();
			if (rs.next()) {
				String dbpw = rs.getString("passwd");
				if (dbpw.equals(bb.getPasswd())) {
					ps = conn.prepareStatement(sql);
					ps.setString(1, bb.getWriter());
					ps.setString(2, bb.getSubject());
					ps.setString(3, bb.getEmail());
					ps.setString(4, bb.getContent());
					ps.setInt(5, bb.getNum());
					cnt = ps.executeUpdate();
				} else {
					cnt = 0;
				}
			}
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
	}// updateArticle
}
