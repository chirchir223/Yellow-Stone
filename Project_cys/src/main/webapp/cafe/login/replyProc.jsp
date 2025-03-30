<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String pageNum = request.getParameter("pageNum");
%>

<jsp:useBean id="bb" class="board.BoardBean">
	<jsp:setProperty name="bb" property="*"/>
</jsp:useBean>

<%

bb.setReg_date(new Timestamp(System.currentTimeMillis()));
bb.setIp(request.getRemoteAddr());

BoardDao bdao = BoardDao.getInstance();
bdao.replyArticle(bb); 
		
%>
<jsp:forward page="list.jsp?pageNum=<%= pageNum %>"/>
