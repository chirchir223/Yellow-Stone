<%@page import="oracle.jdbc.rowset.OracleRowSetListenerAdapter"%>
<%@page import="my.shop.CagoBean"%>
<%@page import="my.shop.CagoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/custom2.css" rel="stylesheet">
cago_updateForm.jsp
<br>

<%@ include file="admin_top.jsp"%>
<br>
<br>
<br>
<br>
<br>


<%
request.setCharacterEncoding("UTF-8");
CagoDao cdao = CagoDao.getInstance();
int cnum = Integer.parseInt(request.getParameter("cnum"));
CagoBean cb = cdao.getCagoByCnum(cnum);

session.setAttribute("snum", cb.getCnum());

%>
<style type="text/css">
.form-group{
   margin: auto;
   align-items: center;
}

.container1 {
    border: 1px solid #CCCCCC; /* 테두리 스타일과 색상 설정 */
    padding: 30px; /* 테두리 내부 여백 설정 */
    max-width: 900px;
    margin: auto; /* 가운데 정렬 */
    border-radius: 10px;
}

</style>

<div class="container1" align="center">
	<h4 align="center">카테고리 수정</h4>
	<hr>
	<form role="form" class="form-inline" action="cago_updateProc.jsp"
		method="post">
		<div class="form-group">
			<label for="code">카테고리 코드</label> 
			<input type="text" class="form-control" name="code" value="<%=cb.getCode() %>">
		</div>

		<div class="form-group">
			<label for="cname">카테고리명</label> 
			<input type="text" class="form-control" name="cname" value="<%= cb.getCname()%>">
		</div>
		<div class="form-group">
			<input type="submit" class="btn btn-default" value= "수정">
		</div>

	</form>

</div>