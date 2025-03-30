<%@page import="my.shop.CagoDao"%>
<%@page import="my.shop.CagoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
cago_Proc.jsp<br>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="cb" class="my.shop.CagoBean">
<jsp:setProperty name = "cb" property = "*"/>
</jsp:useBean>

<%
CagoDao cdao = CagoDao.getInstance();

int cnt = cdao.insetCago(cb);

String msg;
String url;

if (cnt != -1) {
	msg = "카테고리 등록 성공";
	url = "cago_listinput.jsp";
} else {
	msg = "카테고리 등록 실패";
	url = "cago_listinput.jsp";
}

%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>