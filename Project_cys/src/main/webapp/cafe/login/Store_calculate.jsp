<%@page import="my.shop.PmdBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="StoreCart" class="my.shop.store.CartBean" scope="session"/>
<jsp:useBean id="order" class="my.shop.store.OrdermDao" scope="session" />

<%

int memno = (Integer) session.getAttribute("memno");
Vector<PmdBean> clist = StoreCart.getAllPmd();
int cnt = order.insertOrders(memno,clist);

String msg;

if(cnt > 0){
	msg = "주문성공";
	StoreCart.removeAllPmd();
}else{
	msg = "주문실패";
}
%>
<script>
        alert("<%=msg%>");
        location.href = "cafe_main.jsp";
</script>