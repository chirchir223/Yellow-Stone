<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/kfonts2.css" rel="stylesheet">
<%@ include file="cafe_top.jsp"%>

<style type="text/css">
/* body {
  text-align: center;
}

 #carousel-example-generic {
	margin-top: -50px;
}

 .carousel-inner .item img {
    max-width: 100%;
    max-height: 100%;
    width: auto;
    height: auto;
} */

</style>


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
			<div class="carousel-inner">
				<div class="item active">
					<img src="../../images/cafe1.jpg" alt="First slide"
						>
				</div>
				<div class="item">
					<img src="../../images/cafe3.jpg" alt="Second slide"
						>
				</div>
				<div class="item">
					<img src="../../images/cafe2.jpg" alt="Third slide"
						>
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
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../js/bootstrap.min.js"></script>
	<script>
		$('.carousel').carousel() /* 1 */
	</script>
</body>

<br>
<%@ include file="cafe_bottom.jsp"%>
