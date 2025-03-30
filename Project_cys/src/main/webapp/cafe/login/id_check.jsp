<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	
	MemberDao mdao = MemberDao.getInstance();
	boolean flag = mdao.searchId(userid);
	 
	if(flag){
		out.print("중복되는 아이디 입니다.");
	}
	else{
		out.print("사용가능한 아이디 입니다.");
	}
%> 
 