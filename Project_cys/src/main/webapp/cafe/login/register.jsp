<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/script.js"></script>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/custom2.css" rel="stylesheet">
<%@include file="cafe_top.jsp"%>
<script type="text/javascript">
	var use;
	var isCheck = false;
	var pwuse;
	var pwsame;

	$(function() {
		//alert(1);

		$("input[name=id]").keydown(function() {
			$('#idmessage').css('display', 'none');
			isCheck = false;
			use = "";
		});
	});

	function duplicate() { // 중복체크 클릭

		isCheck = true;

		$.ajax({
			url : "id_check.jsp",
			data : ({
				userid : $("input[name=id]").val()
			}),
			success : function(data) {
				alert(data);
				flag = true;

				if ($('input[name=id]').val() == "") {
					$('#idmessage').html("아이디가 누락되었습니다.").css("color", "red")
							.show();
					$('input[name=id]').focus();
					stack = 1;
				} else if ($.trim(data) == "YES") {
					//	alert(data);
					$("#idmessage").html("사용가능한 아이디입니다").css("color", "red")
							.show();
					$('input[name=id]').select();
					use = "possible";
				} else {
					$("#idmessage").html("아이디가 이미 있습니다.").css("color", "blue")
							.show();
					use = "impossible";
				}
			}
		});
	}

	function writeSave() {

		if ($('input[name = id]').val() == "") {
			alert("아이디를 입력하세요");
			$('input[name = id]').focus();
			isBlank = true;
			return false;
		} else if (isCheck == false) {
			alert("중복체크 먼저 하세요");
			return false;
		}
		if (pwuse == "formaterror") {
			alert("비밀번호 형식이 틀렸습니다.");
			return false;
		}
		if (pwsame == "nosame") {
			alert("비밀번호가 같지 않습니다.");
			return false;
		}

	}

	function pwcheck() {
		//alert('pwcheck()');
		var pw = document.forms[0].password.value;
		var regexp = /.{3,8}/;
		if (pw.search(regexp) == -1) {
			alert('글자수가 3~8이 아님');
			pwuse = "formaterror";
			return false;
		}
		var chk_num = pw.search(/[0-9]/);
		var chk_eng = pw.search(/[a-z]/);

		if (chk_num < 0 || chk_eng < 0) {
			alert('비밀번호는 영문자와 숫자를 조합하세요.');
			pwuse = "formaterror";//
			return false;
		}
		pwuse = "";
	}

	function repasswordCheck() {

		var pw = document.forms[0].password.value;
		var repw = document.forms[0].repassword.value;

		if (pw != repw) {
			$('#pwmessage').html("비밀번호 불일치").css("color", "red");
			pwsame = "nosame";
		} else {
			$('#pwmessage').html("<font color=blue>비번 일치</font>");
			pwsame = "same";//비번이 일치하는지 일치하지 않는지 확인을 할 수있다.
		}

	}
</script>
<style type="text/css">
body {
	padding-top: 800px;
	margin: auto;
}

.re-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	position: absolute;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.control-label {
	text-align: left;
	padding-right: 5px;
}

.form-control.fixed-width-input {
	width: 400px;
}
</style>


<body>
	<div class="re-container">



		<form class="form-horizontal" role="form" action="registerProc.jsp"
			method="post" onSubmit="return writeSave()">
			<h2 align="center">회원가입</h2>
			<hr>
			<br>

			<!-- form-horizontal : 수평 정렬 -->

			<div class="form-group">
				<!-- control-label을 사용해서 이름 레이블을 오른쪽 정렬한다. -->
				<label for="id" class="col-xs-6 col-lg-3 control-label">아이디</label>
				<div class="col-xs-6 col-lg-6 text-center">
					<div class="input-group">
						<input type="text" name="id"
							class="form-control fixed-width-input" placeholder="아이디">
						<span class="input-group-btn"> <input type="button"
							class="btn btn-default" value="중복체크" onClick="duplicate()">
						</span>
					</div>
				</div>
			</div>

			<div class="form-group text-center">
				<label for="password" class="col-xs-6 col-lg-3 control-label">비밀번호</label>
				<div class="col-xs-6 col-lg-6">
					<input type="password" name="password"
						class="form-control fixed-width-input" onBlur="pwcheck()"
						placeholder="비밀번호">
				</div>
			</div>

			<div class="form-group text-center">
				<label for="repassword" class="col-xs-6 col-lg-3 control-label">비밀번호확인</label>
				<div class="col-xs-6 col-lg-6">
					<input type="password" name="repassword"
						class="form-control fixed-width-input" onKeyUp="repasswordCheck()"
						placeholder="비밀번호 확인">
				</div>
			</div>

			<div class="form-group text-center" align="center">
				<label for="email" class="col-xs-6 col-lg-3 control-label">이메일</label>
				<div class="col-xs-6 col-lg-6">
					<input type="email" name="email"
						class="form-control fixed-width-input" placeholder="이메일">
				</div>
			</div>

			<div class="form-group text-center">
				<label for="birth" class="col-xs-6 col-lg-3 control-label">생년월일</label>
				<div class="col-xs-6 col-lg-6">
					<input type="date" name="birth"
						class="form-control fixed-width-input" placeholder="생년월일">
				</div>
			</div>

			<div class="form-group text-center">
				<label for="name" class="col-xs-6 col-lg-3 control-label">이름</label>
				<div class="col-xs-6 col-lg-6">
					<input type="text" name="name"
						class="form-control fixed-width-input" placeholder="이름">
				</div>
			</div>


			<div class="form-group text-center">
				<label for="telecom" class="col-xs-6 col-lg-3 control-label">통신사</label>
				<div class="col-xs-6 col-lg-6"
					class="form-control fixed-width-input">
					<select class="form-control fixed-width-input" name="telecom">
						<option value="선택"></option>
						<option value="SKT">SKT</option>
						<option value="KT">KT</option>
						<option value="LG U+">LG U+</option>
						<option value="SKT알뜰폰">SKT알뜰폰</option>
						<option value="KT알뜰폰">KT알뜰폰</option>
						<option value="LG U+알뜰폰">LG U+알뜰폰</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="hphone" class="col-xs-6 col-lg-3 control-label">휴대전화번호</label>
				<div class="col-xs-6 col-lg-6">
					<input type="text" name="hphone"
						class="form-control fixed-width-input"
						placeholder="ex) 010-1234-5678">
				</div>
			</div>
			<br>
			<hr>
			<div class="form-group text-center">
				<div class="col-xs-offset-1 col-xs-10 col-lg-offset-1 col-lg-10">
					<button type="submit" class="btn btn-primary">ㅤ확인ㅤ</button>
					<button type="reset" class="btn btn-danger">ㅤ취소ㅤ</button>
				</div>
			</div>

		</form>
	</div>

</body>

<%@include file="cafe_bottom.jsp"%>
