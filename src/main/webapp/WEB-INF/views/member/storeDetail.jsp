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
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<script>
		
	</script>
	</head>
	<body>

<jsp:include page="normalHeader.jsp"></jsp:include>
		


	<c:choose>
		<c:when test="${list.store_type eq 1 }">
			<div class="fh5co-parallax" style="background-image: url(${pageContext.request.contextPath}/img/nol.jpg);" data-stellar-background-ratio="0.5">
		</c:when>
		<c:when test="${list.store_type eq 2 }">
			<div class="fh5co-parallax" style="background-image: url(${pageContext.request.contextPath}/img/muk.jpg);" data-stellar-background-ratio="0.5">
		</c:when>
		<c:when test="${list.store_type eq 3 }">
			<div class="fh5co-parallax" style="background-image: url(${pageContext.request.contextPath}/img/ja.jpg);" data-stellar-background-ratio="0.5">
		</c:when>
	</c:choose>
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
					<div id="storeInfomation">매장 정보 
						<c:if test="${sessionScope.mb_uid != null }">
						<c:choose>
							<c:when test="${empty like}">
								<div id="likebtn">
									찜<i class="far fa-heart" style="font-size:20px; color:#F03962; margin-left:5px;"></i>
								</div>
							</c:when>
							<c:when test="${not empty like }">
								<div id="dislikebtn">
									찜<i class="fas fa-heart" style="font-size:20px; color:#F03962; margin-left:5px;"></i>
								</div>							
							</c:when>						
						</c:choose>
						</c:if>
					</div>
					
					<ul class="contact-info">
						<li><i class="icon-table"></i>잔여석 : <b>${restSeat.count }</b></li>
						<li><i class="icon-phone2"></i>${list.store_tel }</li>
						<li><i class="icon-alarm"></i>${list.store_hours }</li>
						<li><i class="icon-star-full"></i>${list.totalAvg }</li>
						<c:choose>
							<c:when test="${list.store_type ne 3 }">
								<li><i class="icon-map3"></i><b id="menu">메뉴판 펼치기</b></li>
							</c:when>
						</c:choose>
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
							<input type="submit" value="RESERVE" class="btn btn-primary" onclick="location.href = '${pageContext.request.contextPath}/customer/cusReserve.nmj?store_uid=${store_uid }&store_type=${list.store_type }'">
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
		
		
		<div class="modalContainer">
		<c:forEach var="menu" items="${foodMenu }">
			<div class="col-md-4 col-sm-6">
				<div class="menuPic">
					<c:choose>
						<c:when test="${empty menu.food_img_sav }">
							<img src="${pageContext.request.contextPath}/img/food/foodDefault.png">
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/img/food/${menu.food_img_sav}">
						</c:otherwise>
					</c:choose>
				</div>
				
				<div class="menuName">
					<p>${menu.food_name }</p>
				</div>
				
				<div class="menuPrice">
					<p>${menu.food_price }원</p>
				</div>
			</div>	
		</c:forEach>
	
	 
	</div>
		
		
		
		
	<div class="clear" style="margin-bottom: 50px;"></div>
		
		
		
		
		
		
		
		
		

	<div class="mapContainer">
		<h2>매장 위치</h2>
		<%--
		<div id="map" class="fh5co-map animate-box" style="outline: 1px solid red"></div>
		 --%>
		
		<div id="kakaoMap" style="width:100%;height:500px;"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5aad8312e36b6cc723c425856d939c6"></script>
		
		
		 
		<script>
		var mapContainer = document.getElementById('kakaoMap'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(${list.store_lat}, ${list.store_long}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var markerImg = "${pageContext.request.contextPath}/img/Marker.png";
	
	var imageSrc = markerImg, // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(55, 60), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(${list.store_lat}, ${list.store_long}); // 마커가 표시될 위치입니다

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition, 
	    image: markerImage // 마커이미지 설정 
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map); 
		</script>
		
		
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
	<script src="${pageContext.request.contextPath}/js/storeDetailMenu.js"></script>

	</body>
</html>

    