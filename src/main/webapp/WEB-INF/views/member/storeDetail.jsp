<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>놀먹자~!</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

  <!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/storeDetail.css">


	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

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
				<a href="main.nmj"><img id="logo" src="${pageContext.request.contextPath}/img/logo/nmj_logo.jpg"></a>
			</div>
			<nav id="fh5co-main-nav" role="navigation">
				<ul>
					<li><a href="main.nmj">메인</a></li>
					<c:choose>
						<c:when test="${list.store_type eq 1 }">
							<li><a href="findStore.nmj?store_type=1" class="active">놀자</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="findStore.nmj?store_type=1">놀자</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${list.store_type eq 2 }">
							<li><a href="findStore.nmj?store_type=2" class="active">먹자</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="findStore.nmj?store_type=2">먹자</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${list.store_type eq 3 }">
							<li><a href="findStore.nmj?store_type=3" class="active">자자</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="findStore.nmj?store_type=3">자자</a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="communityList.nmj">떠들자</a></li>
				</ul>
			</nav>
		</div>
	</header>



	<div class="fh5co-parallax" style="background-image: url(images/hero-1.jpg);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
					<div class="fh5co-intro fh5co-table-cell">
						<h1 class="text-center">${list.store_name }</h1>
						<p>${list.store_address }</p>
					</div>
				</div>
			</div>
		</div>
	</div><!-- end: fh5co-parallax -->
	<div id="fh5co-contact-section">
		<div class="container">
			<div class="row">
				<div class="col-md-4 animate-box">
					<h3>매장 정보</h3>
					<ul class="contact-info">
						<li><i class="icon-table"></i>잔여석 : <b>${restSeat.count }</b></li>
						<li><i class="icon-phone2"></i>${list.store_tel }</li>
						<li><i class="icon-alarm"></i>${list.store_hours }</li>
						<li><i class="icon-star-full"></i>${list.totalAvg }</li>
						
						<c:choose>
							<c:when test="${empty list.store_content }">
								<li><i class="icon-file-text2"></i>해당 매장의 상세설명이 없습니다.</li>
							</c:when>
							<c:otherwise>
								<li><i class="icon-file-text2"></i>${list.store_content }</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div class="col-md-8 animate-box">
					
						<div id="profileImg" class="col-md-12">
							<img src="${pageContext.request.contextPath}/img/store/${list.store_img_sav }">
						</div>

						<div class="col-md-12 reserveSubmit">
							<input type="submit" value="RESERVE" class="btn btn-primary" onclick="location.href = 'cusReserve.nmj?store_uid=${store_uid }'">
						</div>
					</div>
				</div>
			</div>
		</div>

	<div class="mapContainer">
		<h2>매장 위치</h2>
		<div id="map" class="fh5co-map animate-box" style="outline: 1px solid red"></div>
	</div>
	<!-- END map -->


	
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
	<!-- Google Map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<!-- Owl carousel -->
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/google_map.js"></script>
	<!-- Stellar -->
	<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

	</body>
</html>

    