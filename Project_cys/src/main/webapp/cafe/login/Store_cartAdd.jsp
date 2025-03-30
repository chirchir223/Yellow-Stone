<%@page import="my.shop.PmdBean"%>
<%@page import="my.shop.PmdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/kfonts2.css" rel="stylesheet">

<%@ include file="cafe_top.jsp"%>

Store_cartAdd.jsp
<br>

<%
String pnum = request.getParameter("pnum");
String oqty = request.getParameter("oqty");
%>

<jsp:useBean id="StoreCart" class="my.shop.store.CartBean"
	scope="session" />

<%
PmdDao pdao = PmdDao.getInstance();
PmdBean pb = pdao.getPmdByNum(String.valueOf(pnum));

if (pb.getPqty() < Integer.parseInt(oqty)) {
%>
<script type="text/javascript">
	alert("수량초과");
	location.href = "Store_cartList.jsp";
</script>

<%
return;
}
StoreCart.addPmd(pnum,oqty);
response.sendRedirect("Store_cartList.jsp");
%>