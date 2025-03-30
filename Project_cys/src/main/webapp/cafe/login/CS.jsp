<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/kfonts2.css" rel="stylesheet">

<style>

body {
	font-family: 'Nanum Gothic', sans-serif;
	line-height: 1.6;
	color: #333;
}

h2 {
	font-size: 2.5em;
	font-weight: bold;
	color: #FFBA49;
	margin-top: 40px;
	margin-bottom: 20px;
}

h3 {
	font-size: 1.8em;
	font-weight: bold;
	color: #FFBA49;
	margin-top: 30px;
	margin-bottom: 15px;
}

p, ul {
	font-size: 1.1em;
	margin-bottom: 15px;
}

.coffee-image {
	width: 100%;
	max-width: 500px;
	display: block;
	margin: 20px auto;
	border-radius: 10px;
}
</style>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@ include file="cafe_top.jsp"%>

	<div class="container">
		<h2>COFFEE STORY</h2>
		<p>Yellow Stone 카페는 고품질의 원두를 사용하여 최상의 커피를 제공합니다. 우리는 전 세계에서 엄선한
			원두를 직접 로스팅하여 풍부한 풍미와 향을 느낄 수 있는 커피를 선사합니다.</p>

		<img src="../../images/cafe001.jpg" class="coffee-image">

		<h3>YS원두란?</h3>
		<p>Yellow Stone 카페는 아래와 같은 특별한 원두를 사용합니다.</p>
		<ul>
			<li>신선하고 고품질의 아라비카 원두</li>
			<li>정통 이탈리안 로스팅 기술을 적용한 로스팅</li>
			<li>다양한 원산지의 원두 제공</li>
			<li>카페의 독특한 맛과 향을 살린 블렌딩</li>
			<li>친환경적인 원두 구매와 로스팅 공정</li>
		</ul>
	</div>

	<%@ include file="cafe_bottom.jsp"%>
</body>
</html>

