<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>예약페이지</title>

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

<!-- DatePicker -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/datepicker.min.css">

<!-- Modernizr JS -->
<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>

</head>
<script>
// form 검증
function chkSubmit(){
	
	frm = document.forms["frm"];
	
	// 현재 날짜와 시간을 가지는 객체를 리턴
	var today = new Date();
	
	var cur_year = today.getFullYear(); // 년도
	var cur_month = today.getMonth() + 1;  // 월
	var cur_date = today.getDate();  // 날짜
	var cur_day = today.getDay();  // 요일
	
	var reservation_date = frm["reservation_date"].value.trim();
	var reservation_start = frm["reservation_start"].value.trim();
	var reservation_end = frm["reservation_end"].value.trim();
	var reservation_count = frm["reservation_count"].value.trim();
	var reservation_price = frm["reservation_price"].value.trim();
	
	var res_year = reservation_date.substring(0,4);
	res_year *= 1;	// 비교하기 위해 number 타입으로 형변환
	cur_year *= 1;	// 비교하기 위해 number 타입으로 형변환
	
	var res_month = reservation_date.substring(6,8);
	res_month *= 1;	// 비교하기 위해 number 타입으로 형변환
	cur_month *= 1;	// 비교하기 위해 number 타입으로 형변환
	
	var res_date = reservation_date.substring(10,12);
	res_date *= 1; // 비교하기 위해 number 타입으로 형변환
	cur_date *= 1; // 비교하기 위해 number 타입으로 형변환
	
	// 예약날짜가 과거일 경우 return false
	if(cur_year > res_year ||
			(cur_year == res_year && cur_month > res_month) ||
			(cur_year == res_year && cur_month == res_month && cur_date > res_date)){
		alert("예약가능한 날짜가 아닙니다.")
		return false;
	}
	
	// 예약시간이 과거일 경우 return false
	var res_start = reservation_start.replace(":","");
	var res_end = reservation_end.replace(":","");
	res_start *= 1;
	res_end *= 1;
	
	if(res_start > res_end || res_start == res_end){
		alert("예약가능한 시간이 아닙니다.")
		return false;
	}
	
	// 공백문자일 경우 return false
	if(reservation_date == ""){
		alert("날짜를 입력해주세요.");
		frm["reservation_date"].focus();
		return false;
	}
	if(reservation_start == "" || reservation_start == "시작 시간"){
		alert("시작 시간을 입력해주세요.");
		frm["reservation_start"].focus();
		return false;
	}
	if(reservation_end == "" || reservation_end == "종료 시간"){
		alert("종료 시간을 입력해주세요.");
		frm["reservation_end"].focus();
		return false;
	}
	if(reservation_count == ""){
		alert("인원을 입력해주세요.");
		frm["reservation_count"].focus();
		return false;
	}
	if(reservation_price == ""){
		alert("금액이 0원입니다.");
		frm["reservation_date"].focus();
		return false;
	}
	if((reservation_end - reservation_start) < 0){
		alert("종료시간이 시작시간보다 앞설 수 없습니다.")
		frm["reservation_end"].focus();
		return false;
	}
	
	return true;
}
</script>
<body>

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
					<h2>매장 예약</h2>
					<p>"앗! 자리 없어질라 얼른 서두르세요~!"</p>
				</div>
			</div>
		</div>
	</div>
	<!-- end fh5co-intro-section -->
	
	<div class="div-relative" style="width: 100%; height: 1000px;">
		<div id="reserve_frm_container">
			<form name="frm" id="reserve_frm" onsubmit="return chkSubmit();">
				<table>
					<tr>
						<th>
							<div>날짜 선택</div>
						</th>
						<th>
						</th>
					</tr>
					<tr>
						<td>
							<input type='text' name="reservation_date" placeholder="날짜를 고르세요" id="my-element" class='datepicker-here reserve_info form-control myInput' data-language='en' />
						</td>
						<td>
							<select name="reservation_start" class="custom-select" style="width: 200px; height: 50px; font-size: 17px;">
								<option selected>시작 시간</option>
								<option value="00:00">00:00</option>
								<option value="01:00">01:00</option>
								<option value="02:00">02:00</option>
								<option value="03:00">03:00</option>
								<option value="04:00">04:00</option>
								<option value="05:00">05:00</option>
								<option value="06:00">06:00</option>
								<option value="07:00">07:00</option>
								<option value="08:00">08:00</option>
								<option value="09:00">09:00</option>
								<option value="10:00">10:00</option>
								<option value="11:00">11:00</option>
								<option value="12:00">12:00</option>
								<option value="13:00">13:00</option>
								<option value="14:00">14:00</option>
								<option value="15:00">15:00</option>
								<option value="16:00">16:00</option>
								<option value="17:00">17:00</option>
								<option value="18:00">18:00</option>
								<option value="19:00">19:00</option>
								<option value="20:00">20:00</option>
								<option value="21:00">21:00</option>
								<option value="22:00">22:00</option>
								<option value="23:00">23:00</option>
								<option value="24:00">24:00</option>
							</select>
							~
							<select name="reservation_end" class="custom-select" style="width: 200px; height: 50px; font-size: 17px;">
								<option selected>종료 시간</option>
								<option value="00:00">00:00</option>
								<option value="01:00">01:00</option>
								<option value="02:00">02:00</option>
								<option value="03:00">03:00</option>
								<option value="04:00">04:00</option>
								<option value="05:00">05:00</option>
								<option value="06:00">06:00</option>
								<option value="07:00">07:00</option>
								<option value="08:00">08:00</option>
								<option value="09:00">09:00</option>
								<option value="10:00">10:00</option>
								<option value="11:00">11:00</option>
								<option value="12:00">12:00</option>
								<option value="13:00">13:00</option>
								<option value="14:00">14:00</option>
								<option value="15:00">15:00</option>
								<option value="16:00">16:00</option>
								<option value="17:00">17:00</option>
								<option value="18:00">18:00</option>
								<option value="19:00">19:00</option>
								<option value="20:00">20:00</option>
								<option value="21:00">21:00</option>
								<option value="22:00">22:00</option>
								<option value="23:00">23:00</option>
								<option value="24:00">24:00</option>
							</select>
						</td>
					</tr>
				</table>
				<hr width="100%" align="center" size="0.7px">
				<table>
					<tr>
						<th>
							<div>인원 및 좌석선택</div>
						</th>
						<th>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" placeholder="인원을 입력하세요" name="reservation_count" id="reserve_count" class="reserve_info form-control myInput"/>
						</td>
						<td>
							<div>성일형님 좌석선택 부탁드립니다</div>
						</td>
					</tr>
				</table>
				<hr width="100%" align="center" size="0.7px">
				<table>
					<tr>
						<th>
							<div>금액</div>
						</th>
						<th>
						</th>
					</tr>
					<tr>
						<td>
							<input type="text" placeholder="금액" name="reservation_price" id="reserve_price" class="reserve_info form-control myInput"/>
						</td>
						<td>
							<input type="hidden" name="${mb_uid }">
							<input type="hidden" name="${store_uid }">
							<input type="hidden" name="${store_type }">
							<button class="btn btn-primary myBtn">예약하기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
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
	
	<!-- DatePicker -->
	<script src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
	<!-- Include English language -->
	<script src="${pageContext.request.contextPath}/js/datepicker.en.js"></script>
	
</body>
</html>