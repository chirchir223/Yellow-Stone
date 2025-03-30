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
String pnum = request.getParameter("pnum");
String oqty = request.getParameter("oqty");
if (pnum != null || oqty != null) {//즉시 구매하기에서 넘어옴.
	StoreCart.addPmd(pnum, oqty);
}

Vector<PmdBean> clist = StoreCart.getAllPmd();
DecimalFormat df = new DecimalFormat("###,###");
%>

<style type="text/css">
body {
	padding-top: 100px;
	margin: auto;
}

table {
	border-collapse: collapse;
	margin: auto;
}
</style>
<h3 align="center">결제 내역서</h3>
<br>
<hr
	style="width: 80%; height: 2px; margin: auto; background-color: black; border: none;">
<br>

<table style="width: 730px; height: auto;" class="table table-striped">

	<tr>
		<th>상품명</th>
		<th>수량</th>
		<th>금액</th>
	</tr>
	<%
	int cartTotalPrice = 0;
	if (clist.size() > 0) {
		for (PmdBean pb : clist) {
	%>
	<tr>
		<td><%=pb.getPname()%></td>
		<td><%=pb.getPqty()%></td>
		<td><%=pb.getPrice()%></td>

	</tr>
	<%
	cartTotalPrice += pb.getPrice() * pb.getPqty();
	} //for
	%>
	<tr>
		<td colspan="2"><b>결제하실 총액은:</b> <font color="red"> <%=df.format(cartTotalPrice)%>원<br>
		</font></td>
		<td colspan="1" align="right"><input type="button"
			class="btn btn-default" value="결제하기"
			onClick="location.href = 'Store_calculate.jsp'"></td>
	</tr>

</table>

<%
} //if
%>

<br>
<br>
<br>
<br>
<br>
<br>


<%@include file="cafe_bottom.jsp"%>

