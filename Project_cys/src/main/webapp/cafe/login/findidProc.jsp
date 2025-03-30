<%@page import="my.member.MemberBean"%>
<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findidProc.jsp<br>

<%
request.setCharacterEncoding("UTF-8");
MemberDao mdao = MemberDao.getInstance();

String name = request.getParameter("name");
String hphone = request.getParameter("hphone");

System.out.println("name:" + name);
System.out.println("hphone:" + hphone);

MemberBean mb = mdao.findid(name,hphone);

String msg ;

if(mb == null){
	msg = "가입이 안된 회원입니다.";
}else{
	msg = mb.getId() + "입니다.";
}
%>

<script type="text/javascript">
alert("<%=msg%>");
location.href = "login_main.jsp";
</script>