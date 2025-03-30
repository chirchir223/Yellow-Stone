package my.shop.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Vector;

import my.shop.PmdBean;
import my.shop.PmdDao;

public class CartBean {
	private Vector<PmdBean> clists;

	public CartBean() {
		clists = new Vector<PmdBean>();
		System.out.println("CartBean 생성자");
	}

	public void addPmd(String pnum, String oqty) {
		PmdDao pdao = PmdDao.getInstance();
		PmdBean pb = pdao.getPmdByNum(pnum);
		pb.setPqty(Integer.parseInt(oqty));

		int pnum_new = Integer.parseInt(pnum);
		int oqty_new = Integer.parseInt(oqty);

		System.out.println("clist 갯수:" + clists.size());

		int totalPrice = 0;
		int totalPoint = 0;
		int cPqty = 0;

		for (int i = 0; i < clists.size(); i++) {
			if (clists.get(i).getPnum() == pnum_new) {
				cPqty = clists.get(i).getPqty();
				clists.get(i).setPqty(cPqty + oqty_new);

				totalPrice += clists.get(i).getPrice() * (cPqty + oqty_new);
				totalPoint += clists.get(i).getPoint() * (cPqty + oqty_new);
				pb.setTotalPrice(totalPrice);
				pb.setTotalPoint(totalPoint);
				return;
			}
		} // for

		// 새상품 일때
		totalPrice += pb.getPrice() * pb.getPqty();
		totalPoint += pb.getPoint() * pb.getPqty();
		pb.setTotalPrice(totalPrice);
		pb.setTotalPoint(totalPoint);

		clists.add(pb);

	}// addPmd

	public Vector<PmdBean> getAllPmd() {
		return clists;

	}

	public void setEdit(int pnum, int oqty) {// 상품번호, 수정한 주문수량
		for (int i = 0; i < clists.size(); i++) {
			if (pnum == clists.get(i).getPnum()) {
				clists.get(i).setPqty(oqty);
				break;
			}

		}
	}// setEdit

	public void removePmd(String pnum) {

		for (PmdBean pb : clists) {
			if (pb.getPnum() == Integer.parseInt(pnum)) {
				clists.removeElement(pb);
				break;
			}

		}
	}

	public void removeAllPmd() {
		clists.removeAllElements();
	}

	public int deleteCheckData(String[] rowcheck) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		int cnt = -1;

		String sql = "delete from pmd where pnum =?";
		for (int i = 0; i < rowcheck.length - 1; i++) {
			sql += "or pnum =?";
		}

		try {
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < rowcheck.length; i++) {
				ps.setInt(i + 1, Integer.parseInt(rowcheck[i]));
			}

			cnt = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println("자원/접속 끊기 오류");
			}
		}

		return cnt;

	}
}
