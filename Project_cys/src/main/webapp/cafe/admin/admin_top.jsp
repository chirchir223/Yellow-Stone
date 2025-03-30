<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
admin_top.jsp
<br>

<!doctype html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자페이지</title>

<!-- Bootstrap -->
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/kfonts2.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 0px;
}

.head-logo {
	float: left; /* 이미지를 왼쪽으로 이동시킵니다. */
	margin-right: 10px; /* 이미지와 로고 글씨 사이의 간격 설정 */
	margin-top: 0px; /* 이미지 상단 여백 설정 */
	width: 80px;
	/* height:50px; */
	top: 100px;
	left: 10px;
}
</style>

</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default navbar-fixed-top " role="navigation">


			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="container">

				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-ex1-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="../login/cafe_main.jsp"> <img
						class="head-logo"
						src="<%=request.getContextPath()%>/images/Yellow stone.png"
						style="align: top;"></a> <a class="navbar-brand"
						href="admin_main.jsp">관리자 페이지</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-ex1-collapse">
					<ul class="nav navbar-nav">
						<li><a href="member_list.jsp">회원관리</a></li>
						<li><a href="cago_listinput.jsp">카테고리 관리</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">MD상품관리 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="pmd_list.jsp">상품 목록</a></li>
								<li><a href="pmd_insert.jsp">상품 등록</a></li>
								<li><a href="#"></a></li>
							</ul></li>
					</ul>

				</div>

			</div>
			<!-- 카테고리 관리 | MD상품관리 | 회원관리  -->

		</nav>
		<article></article>
	</div>


	<!-- container 끝 -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../js/bootstrap.min.js"></script>
</body>
</html>