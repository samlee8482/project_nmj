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
<title>커뮤니티 - 리뷰작성</title>
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
<script src="//cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
<script src="js/jquery.js"></script>
<script>
function chkSubmit(){
	frm = document.forms["frm"];
	
	var review_content = frm["review_content"].value.trim();
	var review_rate = frm["review_rate"].value.trim();
	var store_uid = frm["store_uid"].value;
	
	if(review_content.length == 0){
		alert("내용을 입력하세요");
		return false;
	}
	if(review_rate == 0 && store_uid != 0){
		alert("평점을 입력하세요");
		return false;
	} else {
		return true;
	}
	
	return true;
}
</script>
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
					<li><a href="findStore.nmj?store_type=2" >먹자</a></li>
					<li><a href="findStore.nmj?store_type=3">자자</a></li>
					<li><a href="communityList.nmj" class="active">떠들자</a></li>
					
				</ul>
			</nav>
		</div>
	</header>

	<div id="fh5co-intro-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2>리뷰작성</h2>
					<p>"자 이제 여러분의 차례입니다"</p>
				</div>
			</div>
		</div>
	</div>
	<!-- end fh5co-intro-section -->
	
	<div class="div-relative" style="height: 1000px;">
		<div id="write_frm_container">
			<h3>여러분의 리뷰를 남겨주세요</h3><br>
			<form name="frm" method="post" action="writeReviewOk.nmj" onSubmit="return chkSubmit()">
				<!-- 
				<h3 class="main-title">
					<input name="review_content" placeholder="제목을 입력하세요" value="${review_content }" style="width: 100%; padding: 10px;" />
				</h3>
				 -->
				<div style="margin-left: auto; margin-right: auto; width: 600px; height: 600px;">
					<textarea name="review_content" id="editor1"></textarea>
					<script>
						CKEDITOR.replace('editor1', {
							allowedContent: true,
							width: '600px',
							height: '600px'
						});
					</script>
				</div><br><br><br><br><br><br><br>
				
				<c:choose>
					<c:when test="${store_uid eq 0}">
						<div style="display: none;">
							<h3>나의 평점은?</h2>
							<p id="star_grade">
						        <a value="1" href="#">★</a>
						        <a value="2" href="#">★</a>
						        <a value="3" href="#">★</a>
						        <a value="4" href="#">★</a>
						        <a value="5" href="#">★</a>
							</p>
						</div><br><br><br>
					</c:when>
					<c:otherwise>
						<div style="display: inline-block;">
							<h3>나의 평점은?</h2>
							<p id="star_grade">
						        <a value="1" href="#">★</a>
						        <a value="2" href="#">★</a>
						        <a value="3" href="#">★</a>
						        <a value="4" href="#">★</a>
						        <a value="5" href="#">★</a>
							</p>
						</div><br><br><br>
					</c:otherwise>
				</c:choose>
				<input type="hidden" name="mb_uid" value="${mb_uid }" />
				<input type="hidden" name="store_uid" value="${store_uid }" />
				<input id="review_rate" type="hidden" name="review_rate" value="0" />
				<button class="login_btn" type="submit">작성 완료</button>
				
			</form>
		</div>
	</div>
	
	<br><br>
	
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
        $('#star_grade a').click(function(){
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            var length = $(this).addClass("on").prevAll("a").addClass("on").length;
            $("#review_rate").attr('value', length+1);
            return false;
        });
	</script>
	
</body>
</html>