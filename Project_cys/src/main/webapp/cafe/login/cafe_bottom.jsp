<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
footer {
	background-color: #F0EDE5;
	padding: 50px 0;
}

.container {
	width: 80%;
	margin: auto;
}

.footer-content {
	display: flex;
	justify-content: space-between;
}

.footer-section {
	flex: 1;
	padding: 0 20px;
}

.footer-section h2 {
	color: #333;
}

.contact span {
	display: block;
	margin-bottom: 10px;
}

.social a {
	display: inline-block;
	margin-right: 10px;
	color: #333;
}

.links ul {
	list-style-type: none;
	padding: 0;
}

.links li {
	margin-bottom: 10px;
}

.links a {
	color: #333;
}
</style>
</head>
<body>

	<footer>
		<div class="container">
			<div class="footer-content">
				<div class="footer-section about">
					<h2>Yellow Stone</h2>
					<p>매일 아침 신선하게 볶은 커피와 함께 시작하여, 저희 카페만의 특별한 메뉴와 디저트로 하루를 마무리하세요.</p>
					<div class="contact">
						<span><i class="fas fa-phone"></i> 010-1234-5678</span> <span><i
							class="fas fa-envelope"></i> YS1012@example.com</span>
					</div>
					<div class="social">
						<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
							class="fab fa-twitter"></i></a> <a href="#"><i
							class="fab fa-instagram"></i></a>


						<div class="footer-section about">
							<ul style="display: flex; flex-wrap: wrap; list-style-type: none;">
								<li style="margin-right: 20px;"><a href="#">개인정보처리방침 |</a></li>
								<li style="margin-right: 20px;"><a href="#">운영관리 방침 |</a></li>
								<li style="margin-right: 20px;"><a href="#">홈페이지 이용약관 |</a></li>
								<li style="margin-right: 20px;"><a href="#">위치정보 이용약관 |</a></li>
								<li style="margin-right: 20px;"><a href="#">비회원 이용약관 |</a></li>
								<li style="margin-right: 20px;"><a href="#">윤리경영 핫라인 |</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>
