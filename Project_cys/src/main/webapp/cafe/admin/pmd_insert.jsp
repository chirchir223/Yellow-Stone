<%@page import="my.shop.CagoBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CagoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp"%>	
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/custom2.css" rel="stylesheet">

pmb_insert.jsp
<br>
<%
request.setCharacterEncoding("UTF-8");
CagoDao cdao = CagoDao.getInstance();
ArrayList<CagoBean> lists = cdao.getAlllist();
%>

<style type="text/css">
.form-horizontal .control-label {
	text-align: right;
}

.form-control.fixed-width-input {
	width: 230px;
	margin: auto;
}

.form-group {
	margin-bottom: 15px;
}

.login-container {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.control-label {
	text-align: right;
}
</style>
<br><br><br>
<div class="login-container">
	<h2 align="center">상품등록</h2>
	<br>
	<form class="form-horizontal" role="form" action="pmd_insertProc.jsp"
		method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="id" class="col-xs-4 col-lg-4 control-label">상품명</label>
			<div class="col-xs-4 col-lg-4">
				<input type="text" name="pname"
					class="form-control fixed-width-input" placeholder="상품명">
			</div>
		</div>
		<div class="form-group">
			<label for=pcategory_fk class="col-xs-4 col-lg-4 control-label">상품카테고리</label>
			<div class="col-xs-4 col-lg-4">
				<select class="form-control" name="pcategory_fk">
					<%
					if (lists.size() == 0) {
						out.println("<option>카테고리X</option>");
					} else {

						for (CagoBean cb : lists) {
					%>
					<option value="<%=cb.getCode()%>">
						<%=cb.getCname()%>
						<%
						}
						}
						%>
					
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="pimage" class="col-xs-4 col-lg-4 control-label">상품이미지</label>
			<div class="col-xs-4 col-lg-4">
				<input type="file" name="pimage"
					class="form-control fixed-width-input">
			</div>
		</div>

		<div class="form-group">
			<label for="pqty" class="col-xs-4 col-lg-4 control-label">상품수량</label>
			<div class="col-xs-4 col-lg-4">
				<input type="text" name="pqty"
					class="form-control fixed-width-input">
			</div>
		</div>

		<div class="form-group">
			<label for="price" class="col-xs-4 col-lg-4 control-label">상품가격</label>
			<div class="col-xs-4 col-lg-4">
				<input type="text" name="price"
					class="form-control fixed-width-input">
			</div>
		</div>
		<div class="form-group">
			<label for="pcontents" class="col-xs-4 col-lg-4 control-label">상세정보</label>
			<div class="col-xs-4 col-lg-4">
				<textarea name="pcontents" class="form-control fixed-width-input"></textarea>
			</div>
		</div>

		<div class="form-group">
			<label for="point" class="col-xs-4 col-lg-4 control-label">상품포인트</label>
			<div class="col-xs-4 col-lg-4">
				<input type="text" name="point"
					class="form-control fixed-width-input">
			</div>
		</div>

		<div class="form-group text-center">
			<div class="col-xs-offset-4 col-xs-4 col-lg-offset-4 col-lg-4"
				align="center">
				<button type="submit" class="btn btn-primary ">등록</button>
				
			</div>
		</div>
	</form>

</div>