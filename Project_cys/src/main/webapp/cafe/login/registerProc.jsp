<%@page import="my.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

MemberDao mdao = MemberDao.getInstance();
//System.out.println("registerPro.jsp mdao:" + mdao); (확인o)
%>

<jsp:useBean id="mb" class="my.member.MemberBean">
  <jsp:setProperty name="mb" property="*"/>
</jsp:useBean>

<%
int cnt = mdao.insertMember(mb);

String msg;
String url;

if(cnt > 0){
	msg = "회원가입 완료.";
	url = "cafe_main.jsp";
}else{
	msg = "회원가입 실패. 다시 시도하세요.";
	url = "login_main.jsp";
}

%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>

<!-- 
삽입성공 시 cafe_main.jsp으로 이동
회원가입 성공 alert 띄우기 ("회원가입 완료.")
실패 시 다시 로그인 창으로 보내기 login_main.jsp
실패 alert 띄우기("회원가입 실패. 다시 시도하세요.")
 -->