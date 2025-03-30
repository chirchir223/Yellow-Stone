<%@page import="my.shop.CagoBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CagoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/custom2.css" rel="stylesheet">

<%
request.setCharacterEncoding("UTF-8");
CagoDao cdao = CagoDao.getInstance();
%>
<style type="text/css">
.fixed-table {
	width: 750px;
	margin: auto;
}

.container1 {
    border: 1px solid #CCCCCC; /* 테두리 스타일과 색상 설정 */
    padding: 30px; /* 테두리 내부 여백 설정 */
    max-width: 900px;
    margin: auto; /* 가운데 정렬 */
    border-radius: 10px;
}


</style>

<%@ include file="admin_top.jsp"%>

<!-- cago_listinput.jsp -->
<br>
<br>
<br>
<br>

<h4 align="center">
	<font size="5">카테고리 등록</font>
</h4>
<hr
	style="width: 70%; height: 1px; background-color: #CCCCCC; border: none;">
<br>

<div class="container1" align="center">


	<form role="form" class="form-inline" action="cago_Proc.jsp"
		method="post">
		<div class="form-group">
			<label for="code">카테고리 코드</label> <input type="text"
				class="form-control" name="code" placeholder="ex)COFFEE"> 
		</div>


		<div class="form-group">
			<label for="cname">카테고리명</label> <input type="text"
				class="form-control" name="cname" placeholder="ex)커피">
		</div>
		<div class="form-group">
			<input type="submit" class="btn btn-default" value="등록">
		</div>

	</form>
</div>

<br>
<br>
<br>
<br>
<br>

<!-- cago_list.jsp -->
<br>
<h4 align="center">
	<font size="5">카테고리 목록</font>
</h4>
<hr
	style="width: 70%; height: 1px; background-color:#CCCCCC; border: none;">
<br>
<form>
	<table class="table table-striped fixed-table" style="width: 800px;">
		<thead>
			<tr>
				<th class="text-center" bgcolor="" width="10%">번 호</th>
				<th class="text-center" bgcolor="" width="35%">코 드</th>
				<th class="text-center" bgcolor="" width="35%">카테고리명</th>
				<th class="text-center" bgcolor="" width="10%">수 정</th>
				<th class="text-center" bgcolor="" width="10%">삭 제</th>
			</tr>
		</thead>

		<%
		ArrayList<CagoBean> lists = cdao.getAlllist();
		if (lists.size() == 0) {
		%>

		<tr align="center">
			<td colspan="5">등록된 카테고리가 없습니다.</td>
		</tr>

		<%
		}
		%>

		<%
		for (CagoBean cb : lists) {
		%>

		<tr align="center">
			<td><%=cb.getCnum()%></td>
			<td><%=cb.getCode()%></td>
			<td><%=cb.getCname()%></td>
			<td><a href="cago_updateForm.jsp?cnum=<%=cb.getCnum()%>">수정</a></td>
			<td><a href="cago_delete.jsp?cnum=<%=cb.getCnum()%>">삭제</a></td>

		</tr>
		<%
		}
		%>

	</table>
</form>
