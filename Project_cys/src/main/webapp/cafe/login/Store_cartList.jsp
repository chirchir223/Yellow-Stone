<%@page import="my.shop.PmdBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/kfonts2.css" rel="stylesheet">

<%@ include file="cafe_top.jsp"%>

<jsp:useBean id="StoreCart" class="my.shop.store.CartBean"
	scope="session" />
<%
String saveFolder = "/cafe/images";
String requestFolder = request.getContextPath() + "/" + saveFolder;
Vector<PmdBean> clists = StoreCart.getAllPmd();
DecimalFormat df = new DecimalFormat("###,###");
%>
<style type="text/css">
table {
	border-collapse: collapse;
	margin: auto;
}
body {
	padding-top: 100px;
	margin: auto;
}
 */
</style>
<script type="text/javascript">
	function insert() {
		location.href = "insertForm.jsp";
	}

	function allDelete(obj) {

		var rcheck = document.getElementsByName("rowcheck");
		var check = obj.checked;

		if (check) {
			for (var i = 0; i < rcheck.length; i++) {
				rcheck[i].checked = true;
			}
		} else {
			for (var i = 0; i < rcheck.length; i++) {
				rcheck[i].checked = false;
			}

		}
	}

	function selectDelete() {//삭제버튼을 클릭 했을 때.
		var rcheck = document.getElementsByName("rowcheck");

		var flag = false;
		for (var i = 0; i < rcheck.length; i++) {
			if (rcheck[i].checked) {
				flag = true;
				break;
			}
		}
		if (!flag) {
			alert("삭제할 항목을 선택하세요.");
			return;
		}

		document.myform.submit(); //action으로 이동
	}
</script>

<h3 align="center">장바구니</h3>
<br>

<hr
	style="width: 80%; height: 2px; margin: auto; background-color: black; border: none;">
<br>

	<table style="width: 730px;" class="table table-striped">
		<tr>
			<td colspan="5"><a><input type="checkbox" name="allcheck"
					onClick="allDelete(this)"></a> <input type="button"
				class="btn btn-default" value="선택삭제" onClick="selectDelete()">
			</td>
		</tr>
		<tr>
			<th>상품</th>
			<th>수량</th>
			<th>단가</th>
			<th>금액</th>
			<th>삭제</th>
		</tr>

		<%
		int cartTotalPrice = 0;
		int cartTotalPoint = 0;

		if (clists.size() > 0) {
			for (PmdBean pb : clists) {
				String fullPath = requestFolder + "\\" + pb.getPimage();
		%>
		<tr>

			<td><input type="checkbox" name="rowcheck"
				value="<%=pb.getPnum()%>"> <img src="<%=fullPath%>" width=40
				height=40><br> <b><%=pb.getPname()%></b></td>

			<td>
				<form name="f" method="post" action="Store_cartEdit.jsp">

					<input type="hidden" name="pnum" value="<%=pb.getPnum()%>">
					<input type="text" name="oqty" value="<%=pb.getPqty()%>" size="2">개
					<input type="submit" class="btn btn-default" value="수정">
				</form>
			</td>
			<td align="right"><%=df.format(pb.getPrice())%>원<br> [<%=df.format(pb.getPoint())%>]point
			</td>
			<td align="right"><%=df.format(pb.getPrice() * pb.getPqty())%>원<br>
				[<%=df.format(pb.getPoint() * pb.getPqty())%>]point</td>
			<td width="15%"><button class="btn btn-default">
					<a href="Store_cartDel.jsp?pnum=<%=pb.getPnum()%>">삭제</a>
				</button></td>
		</tr>

		<%
		cartTotalPrice += pb.getPrice() * pb.getPqty();
		cartTotalPoint += pb.getPoint() * pb.getPqty();
		}
		%>
		<tr class=m1>
			<td colspan=3><b>장바구니 총액 : </b> <font color="red"> <%=df.format(cartTotalPrice)%>원<br>
			</font></td>
			<td colspan=2 align="right">
				<button class="btn btn-default">
					<a href="Store_order.jsp">주문하기</a>
				</button>
				<button class="btn btn-default">
					<a href="Store.jsp">계속 쇼핑</a>
				</button>
			</td>
		</tr>


		<%
		} else {
		%>

		<tr>
			<td colspan="6" align="center"><b>장바구니에 담긴 상품이 없습니다.</b></td>


			<%
			}
			%>
		
	</table>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<%@include file="cafe_bottom.jsp"%>