<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/kfonts2.css" rel="stylesheet">
<%@ include file="cafe_top.jsp"%>

<style type="text/css">
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


<h3 align="center">COFFEE</h3>
<hr
	style="width: 70%; height: 1px; margin: auto; background-color: black; border: none;">

<br>
<br>
<br>
<body>
<div class="container">
	<div class="row">

		<div class="col-xs-12 col-sm-6 col-md-3 ">
			<div class="thumbnail">
				<img src="../../images/coffee3.png" alt="...">
				<div class="caption">
					<p>카페 아메리카노</p>
					<!-- <p><a href="#" class="btn btn-primary" role="button">Button</a></p> -->
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

	</div>
</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../js/bootstrap.min.js"></script>
</body>

<%@ include file="cafe_bottom.jsp"%>