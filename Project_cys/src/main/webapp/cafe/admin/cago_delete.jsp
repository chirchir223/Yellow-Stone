<%@page import="my.shop.CagoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
cago_delete.jsp
<br>

<%
request.setCharacterEncoding("UTF-8");
int cnum = Integer.parseInt(request.getParameter("cnum"));

CagoDao cdao = CagoDao.getInstance();

int cnt = cdao.DeleteCago(cnum);

String msg;
String url;

if (cnt != -1) {
	msg = "카테고리 삭제 성공";
	url = "cago_listinput.jsp";
} else {
	msg = "카테고리 삭제 실패";
	url = "cago_listinput.jsp";
}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
