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
<jsp:include page="normalHeader.jsp"></jsp:include>
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
	
	<div class="div-relative" style="width: 100%; height: auto;">
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
					<tr>
						<c:forEach var="item" items="${myPageReservation}" varStatus="status">
							<c:set var = "store_type" value="${item.store_type}"/>
							<c:choose>
								<c:when test="${fn:contains(store_type, 3)}">
									<td>${status.index + 1}</td>
									<td><a href="writeReview.nmj?mb_uid=${item.mb_uid}&store_uid=${item.store_uid }">${item.store_name }</a></td>
									<td>${item.store_start }</td>
									<td>${item.store_end }</td>
									<td>${item.reservation_count }</td>
									<td>${item.reservation_price }</td>
									<td>${item.reservation_seat }</td>
								</c:when>
								<c:otherwise>
									<td colspan="7">예약 기록이 없습니다.</td>
								</c:otherwise>
							</c:choose>
							
							<c:if test="${item.store_type == 1}">
								<td>${status.index + 1}</td>
								<td><a href="writeReview.nmj?mb_uid=${item.mb_uid}&store_uid=${item.store_uid }">${item.store_name }</a></td>
								<td>${item.store_start }</td>
								<td>${item.store_end }</td>
								<td>${item.reservation_count }</td>
								<td>${item.reservation_price }</td>
								<td>${item.reservation_seat }</td>
							</c:if>
							<c:if test="${fn:contains(store_type, 3)}">
								<td colspan="7">예약 기록이 없습니다.</td>
							</c:if>			
						</c:forEach>
					</tr> 
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
					<c:forEach var="item" items="${myPageReservation}" varStatus="status">
						<c:if test="${item.store_type == 2}">
							<td>${status.index + 1}</td>
							<td><a href="writeReview.nmj?mb_uid=${item.mb_uid}&store_uid=${item.store_uid }">${item.store_name }</a></td>
							<td>${item.store_start }</td>
							<td>${item.reservation_count }</td>
							<td>${item.reservation_seat }</td>
						</c:if>
						<c:if test="${item.store_type == null }">
							<td colspan="5">예약 기록이 없습니다.</td>
						</c:if>			
					</c:forEach>
				</tr> 
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
				<tr>
					<c:forEach var="item" items="${myPageReservation}" varStatus="status">
						<c:if test="${item.store_type == 3}">
							<td>${status.index + 1}</td>
							<td><a href="writeReview.nmj?mb_uid=${item.mb_uid}&store_uid=${item.store_uid }">${item.store_name }</a></td>
							<td>${item.store_start }</td>
							<td>${item.store_end }</td>
							<td>${item.reservation_count }</td>
							<td>${item.reservation_price }</td>
							<td>${item.reservation_seat }</td>
						</c:if>
						<c:if test="${item.store_type == null }">
							<td colspan="7">예약 기록이 없습니다.</td>
						</c:if>			
					</c:forEach>
				</tr> 
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
							<td>${item.store_name }</td>
							<td>${item.store_type }</td>
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