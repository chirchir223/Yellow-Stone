<%@page import="my.shop.PmdBean"%>
<%@page import="my.shop.PmdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
UpdatePmd_form.jsp
<br>

<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/custom2.css" rel="stylesheet">

<%
request.setCharacterEncoding("UTF-8");
String pnum = request.getParameter("pnum");
PmdDao pdao = PmdDao.getInstance();
PmdBean pb = pdao.getPmdByNum(pnum);
%>

<%@ include file="admin_top.jsp"%>

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

<div class="login-container">
	<h2 align="center">상품수정</h2>
	<br>
	<form class="form-horizontal" role="form" action="UpdatePmd_Proc.jsp"
		method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="id" class="col-xs-4 col-lg-4 control-label">상품번호</label>
			<div class="col-xs-4 col-lg-4">
				<%=pb.getPnum()%>
				<input type="hidden" name="pnum" value="<%=pb.getPnum()%>"
					class="form-control fixed-width-input">
			</div>
		</div>

		<div class="form-group">
			<label for=pcategory_fk class="col-xs-4 col-lg-4 control-label">상품카테고리</label>
			<div class="col-xs-4 col-lg-4">
				<input type="text" name="pcategory_fk" value="<%=pb.getPcategory_fk()%>" disabled="disabled"
				class="form-control fixed-width-input">
			</div>
		</div>


		<div class="form-group">
			<label for="id" class="col-xs-4 col-lg-4 control-label">상품명</label>
			<div class="col-xs-4 col-lg-4">

				<input type="text" name="pname" value="<%=pb.getPname()%>"
					class="form-control fixed-width-input">
			</div>
		</div>


		<div class="form-group">
			<label for="pimage" class="col-xs-4 col-lg-4 control-label">상품이미지</label>
			<div class="col-xs-4 col-lg-4">
				<img
					src="<%=request.getContextPath()%>/cafe/images/<%=pb.getPimage()%>"
					alt="상품이미지" width="100"> <input type="file" name="pimage"
					value="파일선택" class="form-control fixed-width-input"> <input
					type="text" name="pimage2" value="<%=pb.getPimage()%>"
					class="form-control fixed-width-input">
			</div>
		</div>

		<div class="form-group">
			<label for="pqty" class="col-xs-4 col-lg-4 control-label">상품수량</label>
			<div class="col-xs-4 col-lg-4">
				<input type="text" name="pqty" value="<%=pb.getPqty()%>"
					class="form-control fixed-width-input">
			</div>
		</div>

		<div class="form-group">
			<label for="price" class="col-xs-4 col-lg-4 control-label">상품가격</label>
			<div class="col-xs-4 col-lg-4">
				<input type="text" name="price" value="<%=pb.getPrice()%>"
					class="form-control fixed-width-input">
			</div>
		</div>
		<div class="form-group">
			<label for="pcontents" class="col-xs-4 col-lg-4 control-label">상세정보</label>
			<div class="col-xs-4 col-lg-4">
				<textarea name="pcontents" class="form-control fixed-width-input"><%=pb.getPcontents()%></textarea>
			</div>
		</div>

		<div class="form-group">
			<label for="point" class="col-xs-4 col-lg-4 control-label">상품포인트</label>
			<div class="col-xs-4 col-lg-4">
				<input type="text" name="point" value="<%=pb.getPoint()%>"
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