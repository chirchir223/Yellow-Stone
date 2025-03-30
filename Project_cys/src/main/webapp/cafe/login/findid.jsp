<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/script.js"></script>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/custom2.css" rel="stylesheet">

<%@include file="cafe_top.jsp"%>

<style type="text/css">
body {
	padding-top: 600px;
	margin: auto;
}
.form-horizontal .control-label {
	text-align: right;
}

.form-control.fixed-width-input {
	width: 200px;
}

.form-group {
	margin-bottom: 20px;
}

.login-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

.control-label {
	text-align: left;
	padding-right: 5px;
}

.btn-primary {
	width: 280px;
}
</style>

<body>
<div class="login-container">
	<h3 align="center">아이디 찾기</h3>
	<br>
	<form class="form-horizontal" role="form" action="findidProc.jsp"
		method="post">
		<div class="form-group">
			<label for="name" class="col-xs-6 col-lg-3 control-label">이름</label>
			<div class="col-xs-3 col-lg-3">
				<input type="text" name="name"
					class="form-control fixed-width-input" placeholder="이름">
			</div>

		</div>
		<div class="form-group">
			<label for="hphone" class="col-xs-6 col-lg-3 control-label">전화번호</label>
			<div class="col-xs-3 col-lg-3">
				<input type="text" name="hphone"
					class="form-control fixed-width-input" placeholder="전화번호">
			</div>

		</div>

		<div class="form-group">
			<div align="center">
				<button type="submit" class="btn btn-primary btn-lg">아이디 찾기</button>
			</div>
		</div>

	</form>
</div>
</body>
<%@include file="cafe_bottom.jsp"%>