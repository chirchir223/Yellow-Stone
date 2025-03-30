<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 입력(5) + 1(날짜) + 1(IP)-->
<jsp:useBean id="bb" class="board.BoardBean">
	<jsp:setProperty name="bb" property="*"/>
</jsp:useBean>

<!-- getRemoteAddr: 문자열 리턴 -->

<%
	bb.setReg_date(new Timestamp(System.currentTimeMillis()));
	bb.setIp(request.getRemoteAddr());
	
	BoardDao bdao = BoardDao.getInstance();
	int cnt = bdao.insertArticle(bb); 
	
	String msg, url;
	if(cnt == 1){
		msg = "등록 완료";
		url = "list.jsp";
	}else{
		msg = "등록 실패";
		url = "writeForm.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
