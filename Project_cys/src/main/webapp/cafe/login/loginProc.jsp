<%@page import="my.member.MemberBean"%>
<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
MemberDao mdao = MemberDao.getInstance();

String id = request.getParameter("id");
String password = request.getParameter("password");

System.out.println("login id:" + id);
System.out.println("login password:" + password);

String url;
String msg;

MemberBean member = mdao.getLogin(id, password);

if (member != null) {
	if (id.equals("admin")) { //admin 일 경우
		msg = "관리자 로그인 성공";
		url = "../admin/admin_main.jsp";
	} else {
		msg = "로그인 성공! 환영합니다."; //(게스트이름)님 환영합니다. 
		url = "cafe_main.jsp"; //게스트 로그인 일 경우
	}
	session.setAttribute("memid", id);
	session.setAttribute("memno", member.getNum());
} else {
	msg = "존재하지 않는 회원입니다.";
	url = "login_main.jsp"; //일치하지 않는 회원
}
%>
<script type="text/javascript">
alert("<%=msg%>");
location.href = "<%=url%>";
</script>