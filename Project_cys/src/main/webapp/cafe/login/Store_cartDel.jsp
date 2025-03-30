<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String pnum = request.getParameter("pnum");
%>

<jsp:useBean id="StoreCart" class="my.shop.store.CartBean" scope="session" />

<%
StoreCart.removePmd(pnum);
response.sendRedirect("Store_cartList.jsp");
%>