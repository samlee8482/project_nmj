<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>놀먹자~!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<!-- Modernizr JS -->
<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>


</head>
<body>
	<header>
		<div class="container text-center">
			<div class="fh5co-navbar-brand">
				<a class="fh5co-logo" href="index.html"><img
					src="${pageContext.request.contextPath}/img/logo/nmj_logo.jpg"
					style="width: 200px; height: 150px;" /></a>
			</div>
			<nav id="fh5co-main-nav" role="navigation">
				<ul>
					<li><a href="index.html" class="active">홈</a></li>
					<li><a href="work.html">회원정보수정</a></li>
					<li><a href="services.html">내 매장 리뷰보기</a></li>
					<li><a href="about.html">매장 정보 수정</a></li>
					<li><a href="contact.html">음식 매뉴 관리</a></li>
					<li><a href="contact.html">매장 공간 관리</a></li>
					<li><a href="contact.html">매장 정보 수정 요청</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<div id="fh5co-intro-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2>매장 공간 관리</h2>
					<p>매장의 컨탠츠 공간을 관리 하실 수 있습니다.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- end fh5co-intro-section -->
	<div class="container">


		<div class="col-lg-12">
			<div class="bs-component">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">회원 ID</th>
							<th scope="col">내용</th>
							<th scope="col">평점</th>
							<th scope="col">조회수</th>
							<th scope="col">등록일</th>
						</tr>
					</thead>
					<tbody>
					
						<c:forEach var="list" items="${list }" varStatus="status">
							<c:choose>
							<c:when test="${list.review_rate le 2 }">
								<tr class="table-danger">
							</c:when>
							<c:otherwise>
								<tr>
							</c:otherwise>							
							</c:choose>							
								<td>${status.count }</td>
								<td>${list.mb_uid }</td>
								<td><a href="#">${list.review_content }</a></td>
								<td>${list.review_rate }</td>
								<td>${list.review_viewCount }</td>
								<td>${list.review_date }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- /example -->
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

</body>
</html>

