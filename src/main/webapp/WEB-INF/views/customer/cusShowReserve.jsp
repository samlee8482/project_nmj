<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 - 예약/찜 목록 보기</title>
<style>
table, th, td{
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<title>일반회원 - 마이페이지</title>

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

</head>
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
					<li><a href="findStore.nmj?store_type=1">놀자</a></li>
					<li><a href="findStore.nmj?store_type=2" class="active">먹자</a></li>
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
					<h2>예약&찜 목록</h2>
					<p>"이곳은 당신의 발자취"</p>
				</div>
			</div>
		</div>
	</div>
	<!-- end fh5co-intro-section -->
	
	<div class="div-relative" style="width: 100%; height: 1400px;">
		<div class="show_list_container">
			<h1>놀자 예약목록</h1><br><br><br><br>
			<table>
				<tr>
					<th>No.</th>
					<th>매장</th>
					<th>시작시간</th>
					<th>종료시간</th>
					<th>인원수</th>
					<th>예약금액</th>
					<th>좌석</th>
				</tr>
				<tr>
				<c:if test="${myPageReservation[0].store_type == 1}">
					<tr>
						<c:forEach var="item" items="${myPageReservation}" varStatus="status">
							<td>${status.index + 1}</td>
							<td>${item[0].store_name }</td>
							<td>${item[0].store_start }</td>
							<td>${item[0].store_end }</td>
							<td>${item[0].reservation_count }</td>
							<td>${item[0].reservation_price }</td>
							<td>${item[0].reservation_seat }</td>
						</c:forEach>
					</tr> 
				</c:if>
				<c:if test="${myPageReservation[0].store_type == null }">
					<tr>
						<td colspan="7">예약 기록이 없습니다.</td>
					</tr>
				</c:if>			
			</table>
		
			<br>
		
			<h1>먹자 예약목록</h1><br><br><br><br>
			<table>
				<tr>
					<th>No.</th>
					<th>매장</th>
					<th>예약시간</th>
					<th>인원수</th>
					<th>좌석</th>
				</tr>
				<tr>
				<c:if test="${myPageReservation[0].store_type == 2}">
					<tr>
						<c:forEach var="item" items="${myPageReservation}" varStatus="status">
							<td>${status.index + 1}</td>
							<td>${item[0].store_name }</td>
							<td>${item[0].store_start }</td>
							<td>${item[0].reservation_count }</td>
							<td>${item[0].reservation_seat }</td>
						</c:forEach>
					</tr> 
				</c:if>
				<c:if test="${myPageReservation[0].store_type == null }">
					<tr>
						<td colspan="5">예약 기록이 없습니다.</td>
					</tr>
				</c:if>			
			</table>
		
			<br>
		
			<h1>자자 예약목록</h1><br><br><br><br>
			<table>
				<tr>
					<th>No.</th>
					<th>매장</th>
					<th>시작시간</th>
					<th>종료시간</th>
					<th>인원수</th>
					<th>예약금액</th>
					<th>방</th>
				</tr>
				<c:if test="${myPageReservation[0].store_type == 3}">
					<tr>
						<c:forEach var="item" items="${myPageReservation}" varStatus="status">
							<td>${status.index + 1}</td>
							<td>${item[0].store_name }</td>
							<td>${item[0].store_start }</td>
							<td>${item[0].store_end }</td>
							<td>${item[0].reservation_count }</td>
							<td>${item[0].reservation_price }</td>
							<td>${item[0].reservation_seat }</td>
						</c:forEach>
					</tr> 
				</c:if>
				<c:if test="${myPageReservation[0].store_type == null }">
					<tr>
						<td colspan="7">예약 기록이 없습니다.</td>
					</tr>
				</c:if>			
			</table>
		
			<br>
		
			<h1>찜</h1><br><br><br><br>
			<table>
				<tr>
					<th>No.</th>
					<th>매장</th>
					<th>분류</th>
				</tr>
				<c:if test="${not empty myPageLike}">
					<tr>
						<c:forEach var="item" items="${myPageLike}" varStatus="status">
							<td>${status.index + 1}</td>
							<td>${item[0].store_name }</td>
							<td>${item[0].store_type }</td>
						</c:forEach>
					</tr> 
				</c:if>
				<c:if test="${empty myPageLike }">
					<tr>
						<td colspan="3">찜한 기록이 없습니다.</td>
					</tr>
				</c:if>			
			</table>
		</div>
	</div>
	
	<footer>
		<div id="footer" class="fh5co-border-line">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<p>
							Copyright 2016 Free Html5 <a href="#">Neos</a>. All Rights
							Reserved. <br>Made with <i class="icon-heart3 love"></i> by
							<a href="http://freehtml5.co/" target="_blank">Freehtml5.co</a> /
							Demo Images: <a href="https://www.pexels.com/" target="_blank">Pexels</a>
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

</body>
</html>