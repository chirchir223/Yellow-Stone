<%@page import="my.shop.PmdBean"%>
<%@page import="my.shop.PmdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

int pnum = Integer.parseInt(request.getParameter("pnum"));
int oqty = Integer.parseInt(request.getParameter("oqty"));

%>

<jsp:useBean id="StoreCart" class="my.shop.store.CartBean" scope="session" />

<%
PmdDao pdao = PmdDao.getInstance();
PmdBean pb = pdao.getPmdByNum(String.valueOf(pnum));
if(pb.getPqty() < oqty){
%>
<script type="text/javascript">
	alert("수량초과");
	location.href = "Store_cartList.jsp";
</script>

<%
return;
}
StoreCart.setEdit(pnum, oqty);
%>

<script type="text/javascript">
	alert("주문 수량이 수정되었습니다.");
	//history.back();
	location.href = "Store_cartList.jsp";
</script>