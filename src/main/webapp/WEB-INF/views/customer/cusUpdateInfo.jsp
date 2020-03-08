<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 - 회원 정보 수정</title>
<link rel="shortcut icon" href="favicon.ico">

<!-- 새힘 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/myCSS_sam.css">
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

<c:choose>
	<c:when test="${sessionScope.mb_uid == null || empty sessionScope.mb_uid}">
		<script>
			alert("로그인을 하지 않으셨거나 권한이 없는 사용자 또는 자동 로그아웃 되었습니다. 로그인 해주세요.");
			location.href = "${pageContext.request.contextPath}/member/main.nmj";
		</script>
	</c:when>
</c:choose>

</head>
<script>
function chkSubmit(){
	frm = document.forms["frm"];
	
	var mb_name = frm["mb_name"].value.trim();
	var mb_tel = frm["mb_tel"].value.trim();
	var mb_pw = frm["mb_pw"].value.trim();
	var mb_email = frm["mb_email"].value.trim();
	
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
	if(mb_pw == ""){
		 $(document ).ready( function(){
		        $('mb_pw').removeAttr('pattern');
		 });
	}
	if(mb_pw != ""){
		
	}
	
	return true;
}
</script>

<style>

.filebox input[type="file"] {
   position: absolute;
   width: 0;
   height: 0;
   padding: 0;
   overflow: hidden;
   border: 0;
}

.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #999;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-radius: 5px;
}

/* named upload */
.filebox .upload-name {
    display: inline-block;
  height: 35px;
  font-size:18px; 
  padding: 0 10px;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-radius: 5px;

}
</style>

<body>
	<c:choose>
		<c:when test="${sessionScope.mb_type == 2}">
			<jsp:include page="../store/storeHeader.jsp"/>
		</c:when>
		<c:otherwise>
			<jsp:include page="normalHeader.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>

	<div id="fh5co-intro-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2>회원 정보 수정</h2>
				</div>
			</div>
		</div>
	</div>
	<!-- end fh5co-intro-section -->
	
	<div class="div-relative" style="width: 100%; height: auto; margin: 50px auto;">
		<div id="update_frm_container">
			<form name="frm" id="update_frm" method="post" enctype="Multipart/form-data" action="cusUpdateInfoOk.nmj" onsubmit="">
				<input type="hidden" name="mb_uid" value="${mb_uid }">
				<span id="update_info_container">
					<c:choose>
						<c:when test="${empty myPage.mb_img_sav || fn:length(myPage.mb_img_sav) == 0 }">
							<img src="${pageContext.servletContext.contextPath}/img/member/memberDefault.png" style="height: 200px; margin-bottom: 70px;">
						</c:when>
						<c:otherwise>
							<img src="${pageContext.servletContext.contextPath}/img/member/${myPage.mb_img_sav }" style="height: 200px; margin-bottom: 70px;">
						</c:otherwise>
					</c:choose>
				</span><br><br><br>
				<span id="update_info_container1">이름　　　 <input class="update_info" type="text" name="mb_name" placeholder="회원이름" value="${myPage.mb_name }" required></span><br>
				<span id="update_info_container2">연락처　　 <input class="update_info" type="text" name="mb_tel" placeholder="회원연락처" value="${myPage.mb_tel }" pattern="(^02.{0}|^01.{1}|[0-9]{3})-([0-9]+)-([0-9]{4})"></span><br>
				<span id="update_info_container3">아이디　　 <input class="update_info" type="text" name="mb_id" placeholder="회원아이디" value="${myPage.mb_id }" disabled></span><br>
				<span id="update_info_container4">비밀번호　 <input class="update_info" type="password" name="mb_pw" placeholder="회원비밀번호" value="" pattern="^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$"></span><br>
				<span id="update_info_container5">이메일　　 <input class="update_info" type="text" name="mb_email" placeholder="회원이메일" value="${myPage.mb_email }"></span><br>
				<span id="update_info_container6">프로필변경 <input id="update_info_file" class="update_info" type="file" name="upload" accept="image/*"></span><br><br><br>
				<input type="hidden" name="mb_img_sav" value="${myPage.mb_img_sav }"/>
				<input type="hidden" name="mb_img_org" value="${myPage.mb_img_org }"/>
				<input class="find_btn btn btn-primary" style="width: 100px; margin-top: -40px; padding: 10px;" type="submit" value="수정하기">
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

</body>
</html>