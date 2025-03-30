<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/custom2.css" rel="stylesheet">

<%@include file="cafe_top.jsp"%>

<%
session.invalidate();/* 모든 session은 모두 무효화 된다. */
String id = request.getParameter("id");
String password = request.getParameter("password");
%>

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
	<h2 align="center">Login</h2>
	<br>
	<form class="form-horizontal" role="form" action="loginProc.jsp"
		method="post">
		<div class="form-group">
			<label for="id" class="col-xs-6 col-lg-3 control-label">아이디</label>
			<div class="col-xs-3 col-lg-3">
				<input type="text" name="id" class="form-control fixed-width-input"
					placeholder="아이디">
			</div>
		</div>
		<div class="form-group">
			<label for="password" class="col-xs-6 col-lg-3 control-label">비밀번호</label>
			<div class="col-xs-3 col-lg-3">
				<input type="password" name="password"
					class="form-control fixed-width-input" placeholder="비밀번호">
			</div>
		</div>

		<div class="form-group">
			<div align="center">
				<button type="submit" class="btn btn-primary btn-lg">로그인</button>
			</div>
		</div>
	</form>

	<div>
		<a href="findid.jsp">아이디 찾기</a> | <a href="findpw.jsp">비밀번호 찾기</a> | <a
			href="register.jsp">회원가입</a>
	</div>
</div>
</body>

<%@include file="cafe_bottom.jsp"%>


