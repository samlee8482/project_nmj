<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link rel="shortcut icon" href="favicon.ico">

<!-- Animate.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/owl.theme.default.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootswatch.css">

<!-- 새힘 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/myCSS_sam.css">

<!-- Modernizr JS -->
<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>
</head>
<body>
<script>
// form 검증
function chkSubmit(){
	frm = document.forms["frm"];
	
	var mb_id = frm["mb_id"].value.trim();
	var mb_pw = frm["mb_pw"].value.trim();
	var mb_pwOk = frm["mb_pwOk"].value.trim();
	var mb_name = frm["mb_name"].value.trim();
	var mb_tel = frm["mb_tel"].value.trim();
	var mb_email = frm["mb_email"].value.trim();
	
	if(mb_id == ""){
		alert("아이디를 입력해주세요.");
		frm["mb_id"].focus();
		return false;
	}
	if(mb_pw == ""){
		alert("비밀번호를 입력해주세요.");
		frm["mb_pw"].focus();
		return false;
	}
	if(mb_pwOk == ""){
		alert("비밀번호 재확인을 해주세요.");
		frm["mb_pwOk"].focus();
		return false;
	}
	if(mb_name == ""){
		alert("이름을 입력해주세요.");
		frm["mb_name"].focus();
		return false;
	}
	if(mb_tel == ""){
		alert("연락처를 입력해주세요.");
		frm["mb_tel"].focus();
		return false;
	}
	if(mb_email == ""){
		alert("이메일을 입력해주세요.");
		frm["mb_email"].focus();
		return false;
	}
	if(mb_pw != mb_pwOk){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	} else {
		return true;
	}
}
</script>

	<header>
		<div class="container text-center headerContainer">
				<!-- if(Session.getAttribute("mb_uid") == null) { -->
				<div id="login_signUp">
					<span id="login">로그인</span>
					<span class="line">|</span>
					<span id="signup">회원가입</span>
				</div>
				<!-- } else { -->
				<div id="logout_mypage" style="display: none;">
					<span id="logout">로그아웃</span>
					<span class="line">|</span>
					<span id="mypage">마이페이지</span>
				</div>
				<!-- } -->
				
				<div class="fh5co-navbar-brand">
					<a href="main.nmj"><img id="logo" src="../img/logo/nmj_logo.jpg"></a>
				</div>
			<nav id="fh5co-main-nav" role="navigation">
				<ul>
					<li><a href="main.nmj">메인</a></li>
					<li><a href="findStore.nmj?store_type=1">놀자</a></li>
					<li><a href="findStore.nmj?store_type=2">먹자</a></li>
					<li><a href="findStore.nmj?store_type=3">자자</a></li>
					<li><a href="communityList.nmj">떠들자</a></li>
					
				</ul>
			</nav>
		</div>
	</header>

	<div id="fh5co-intro-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<p class="title">회원가입</h2>
					<p class="subtitle">"놀먹자의 식구가 되어보세요"</p>
				</div>
			</div>
		</div>
	</div>
	<!-- end fh5co-intro-section -->
	
	<div class=" div-relative" style="height: 500px;">
		<div id="signUp_frm_container" class="jumbotron">
			<form name="frm" id="signUp_frm" action="signUpCustomerOk.nmj" onsubmit="return chkSubmit()">
				<div class="signUp_input_container">
					<div class="form-group">
					<input name="mb_id" id="mb_id" class="form-control" placeholder="아이디" required>
					<div class="check_font" id="id_check"></div>
					</div>
					<input type="password" name="mb_pw" class="form-control" placeholder="비밀번호" required>
					<input type="password" name="mb_pwOk" class="form-control" placeholder="비밀번호 재확인" required>
				</div>
				<div class="signUp_input_container">
					<input name="mb_name" class="form-control" placeholder="이름" required>
					<input name="mb_email" class="form-control" placeholder="이메일" required>
					<input name="mb_tel" class="form-control" placeholder="전화번호" required>
					<input name="mb_type" type="hidden" value="1">
				</div>
				<br>
				<button id="reg_submit" class="btn btn-primary myBtn">가입하기</button>
			</form>
		</div>
	</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	
	<footer>
		<div id="footer" class="fh5co-border-line">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<p>
							Copyright 2020 Team <a href="#">Q&A</a>. All Rights
							Reserved. <br>Made with <i class="icon-heart3 love"></i> by
							<a href="#" target="_blank">Korea IT Academy</a> /
							Images: <a href="https://www.pexels.com/" target="_blank">Pexels</a>
							&amp; <a href="http://plmd.me/" target="_blank">PLMD</a>
						</p>
						<p class="fh5co-social-icons">
							<a href="#"><i class="icon-twitter-with-circle"></i></a> <a
								href="#"><i class="icon-facebook-with-circle"></i></a> <a
								href="#"><i class="icon-instagram-with-circle"></i></a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
	<!-- Owl carousel -->
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<!-- Stellar -->
	<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

	<script>
	// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#mb_id").blur(function() {
		// id = "id_reg" / name = "userId"
		var mb_id = $('#mb_id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/user/idCheck?mb_id='+ mb_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(mb_id.trim().length >= 4 && mb_id.trim().length <= 12 ){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else if(mb_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
	</script>
	

</body>
</html>