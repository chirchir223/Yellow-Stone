<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/kfonts2.css" rel="stylesheet">
<%@ include file="cafe_top.jsp"%>
<title>menu</title>

<style type="text/css">
.thumbnail img {
	width: 100%;
	height: auto;
}

body {
	padding-top: 20px;
	margin: auto;
}

btn {
	margin: auto;
}

.caption {
	text-align: center;
	font-style: normal;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		$('.left.carousel-control').click(function() {
			$('#carousel-example-generic').carousel('prev');
		});

		$('.right.carousel-control').click(function() {
			$('#carousel-example-generic').carousel('next');
		});
	});
</script>


<h3 align="center">추천 상품</h3>
<hr
	style="width: 70%; height: 1px; margin: auto; background-color: black; border: none;">

<br>
<br>

<body>
	<div class="container">
		<div id="carousel-example-generic" class="carousel slide">

			<!-- Indicators(이미지 하단의 동그란것->class="carousel-indicators") -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			<!-- Carousel items -->
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<!-- <div class="row"> -->
					<div class="col-sm-4">
						<div class="thumbnail">
							<img src="../../images/coffee1.png">
							<div class="caption">
								<p>카푸치노</p>
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="thumbnail">
							<img src="../../images/coffee2.png">
							<div class="caption">
								<p>카라멜 마키아또</p>
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="thumbnail">
							<img src="../../images/coffee3.png">
							<div class="caption">
								<p>아메리카노</p>
							</div>
						</div>
					</div>
				</div>

			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				data-slide="prev"> <span class="icon-prev"></span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				data-slide="next"> <span class="icon-next"></span>
			</a>
		</div>
	</div>

	<br>
	<br>

	<h3 align="center">전체 상품</h3>
	<hr
		style="width: 70%; height: 1px; margin: auto; background-color: black; border: none;">

	<br>
	<br>
	<br>

	<div class="container">
		<div class="row">

			<div class="col-xs-12 col-sm-6 col-md-3 ">
				<div class="thumbnail">
					<img src="../../images/coffee3.png" alt="...">
					<div class="caption">
						<p>카페 아메리카노</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/coffee1.png" alt="...">
					<div class="caption">
						<p>카푸치노</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/coffee2.png" alt="...">
					<div class="caption">

						<p>카라멜 마키아또</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/choco.png" alt="...">
					<div class="caption">

						<p>시그니처 초콜릿</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/wchoco.png" alt="...">
					<div class="caption">

						<p>고구마 라떼</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/green.png" alt="...">
					<div class="caption">

						<p>제주 말차 라떼</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/tea1.png" alt="...">
					<div class="caption">

						<p>민트 블렌드 티</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/tea2.png" alt="...">
					<div class="caption">

						<p>유스베리 티</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/tea3.png" alt="...">
					<div class="caption">

						<p>자몽 블랙 티</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/tea4.png" alt="...">
					<div class="caption">

						<p>유자 민트 티</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/milkshake.png" alt="...">
					<div class="caption">

						<p>밀크 쉐이크</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/sshake.png" alt="...">
					<div class="caption">

						<p>딸기 쉐이크</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/bshake.png" alt="...">
					<div class="caption">

						<p>블루베리 요거트</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/ade.png" alt="...">
					<div class="caption">

						<p>레몬 에이드</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/ade2.png" alt="...">
					<div class="caption">

						<p>자몽 에이드</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/lemonice.png" alt="...">
					<div class="caption">

						<p>복숭아 아이스티</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/juice.png" alt="...">
					<div class="caption">

						<p>키위 주스</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/mango.png" alt="...">
					<div class="caption">

						<p>망고 주스</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/Cfrappe.png" alt="...">
					<div class="caption">

						<p>초콜릿 크림 칩 프라푸치노</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/Gfrappe.png" alt="...">
					<div class="caption">

						<p>제주 말차 크림 프라푸치노</p>

					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-3">
				<div class="thumbnail">
					<img src="../../images/cokfrappe.png" alt="...">
					<div class="caption">

						<p>쿠앤크 크림 프라푸치노</p>

					</div>
				</div>
			</div>

		</div>

	</div>
	<!-- container 끝 -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../js/bootstrap.min.js"></script>
</body>
</html>

<%@ include file="cafe_bottom.jsp"%>