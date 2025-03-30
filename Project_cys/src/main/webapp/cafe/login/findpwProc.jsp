<%@page import="my.member.MemberBean"%>
<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
findpwProc.jsp<br>

<%
request.setCharacterEncoding("UTF-8");
MemberDao mdao = MemberDao.getInstance();

String id = request.getParameter("id");
String name = request.getParameter("name");
String hphone = request.getParameter("hphone");

System.out.println("id:" + id);
System.out.println("name:" + name);
System.out.println("hphone:" + hphone);

MemberBean mb = mdao.findpw(id,name,hphone);

String msg ;

if(mb == null){
	msg = "일치하는 회원이 없습니다.";
}else{
	msg = mb.getPassword() + "입니다.";
}
%>

<script type="text/javascript">
alert("<%=msg%>");
location.href = "login_main.jsp";
</script>