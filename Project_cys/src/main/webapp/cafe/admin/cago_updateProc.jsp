<%@page import="my.shop.CagoDao"%>
<%@page import="my.shop.CagoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
cago_updateProc.jsp<br>

<%
request.setCharacterEncoding("UTF-8");
CagoDao cdao = CagoDao.getInstance();
%>

<jsp:useBean id="cb" class="my.shop.CagoBean">
<jsp:setProperty name = "cb" property = "*"/>
</jsp:useBean>

<%
int cnt = cdao.UpdateCago(cb);

String msg;
String url;

if (cnt != -1) {
	msg = "카테고리 수정 성공";
	url = "cago_listinput.jsp?cnum=" + cb.getCnum();
} else {
	msg = "카테고리 수정 실패";
	url = "cago_updateForm.jsp?cnum=" + cb.getCnum();
}

%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>