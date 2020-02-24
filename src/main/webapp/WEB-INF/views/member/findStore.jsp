<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%!
	int writePages = 9;
%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>놀먹자~!</title>
	

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<!-- <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'> -->

	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/findStore.css">


	<!-- Modernizr JS -->
	<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

<!-- 페이징 -->
<!-- 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="CSS/common.css"/>
 -->
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
 
 
 
 
 <script>
//페이지 최초 로딩되면 게시글 목록 첫페이지분 로딩

 $(document).ready(function(){
 	$("input#page").val(1);	// 페이지 최초 로딩되면 1페이지
 	// loadPage(1) // n Page 읽어오기

	var html = "<ul>";
	var curPage = parseInt($("input#page").val());

	if(curPage != 1) {
		html += "<li class='back'><i class='fas fa-angle-double-left'></i></li>";
	}
	var calPage = parseInt(curPage / 10); 
	var pagesize = ${totalPage} - calPage*10;
	for(var i = 1; i <= pagesize ; i++){
		html +=	"<li class='eachPage'>"+ (calPage*10 + i) + "</li>";
		
	}
		
		
	if(curPage < ${totalPage}){
		html += "<li class='next'><i class='fas fa-angle-double-right'></i></li>";
	}
	$("#pagination").html(html);
	$(".eachPage").click(function(){	
		var pagetext = $(this).text();
		loadPage(pagetext);
	});
	

 });

 // page번째 페이지 목록 로딩
 function loadPage(page) {
 	
 	$.ajax({
 		url : "${pageContext.request.contextPath}/memberAjax/findStore.nmj/<%= writePages%>/" + page + "?store_type=" + 1,
 		type : "GET",
 		cache : false,
 		success : function(data, status) {
 			if(status == "success") {
 				
 				if(updateList(data)) { // 페이지 업데이트
 					// 페이지 로딩이 성공한 후에야 현재 페이지 정보 업데이트
 					$("input#page").val(page);
 				}
 			}
 		}
 		
 	});
 } // end loadPage()


 function updateList(jsonObj) {
 	result = "";
 	
 	if(jsonObj.status == "OK") {
 		
 		var count = jsonObj.count; // 글 개수
 		var items = jsonObj.list; // 글 목록
 		
 		var i;
 		for(i = 0; i < count; i++) {
 			result +='<div class="col-md-4 col-sm-6"><div class="fh5co-grid-work"><div class="work-holder"><a href="storeDetail.nmj?store_uid=';
 			result += items[i].store_uid+">";
 			if(items[i].store_img_sav != null){
 				result += '<img src="' + items[i].store_img_sav + '">';
 			}else{
 				result += '<img src="">';
 			}
 			result += '</a><a href="storeDetail.nmj?store_uid=' + items[i].store_uid + '" class="inner-overlay"><iclass="icon-plus"></i></a>';
 			result += '</div><div class="desc"><h3><a href="storeDetail.nmj?store_uid=' + items[i].store_uid + '">';
 			result += items[i].store_name + '</a></h3><span>' + items[i].store_dname + '</span></div></div></div>'; 
 		}
 		
 		$("#storeLists").html(result); // 테이블 내용 업데이트
 		
 		return true;
 	} else {
 		return false;
 	}
 	
 	return false;
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
				<a href="main.nmj"><img id="logo" src="${pageContext.request.contextPath}/img/logo/nmj_logo.jpg"></a>
			</div>
			<nav id="fh5co-main-nav" role="navigation">
				<ul>
					<li><a href="main.nmj">메인</a></li>
					<c:choose>
						<c:when test="${store_type eq 1 }">
							<li><a href="findStore.nmj?store_type=1" class="active">놀자</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="findStore.nmj?store_type=1">놀자</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${store_type eq 2 }">
							<li><a href="findStore.nmj?store_type=2" class="active">먹자</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="findStore.nmj?store_type=2">먹자</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${store_type eq 3 }">
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
				<div
					class="col-md-8 col-md-offset-2 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
					<div class="fh5co-intro fh5co-table-cell">
						<h1 class="text-center">매장찾기</h1>
						<p>놀먹자에 등록한 사장님들의 매장을 한눈에 보실 수 있습니다</p>
					</div>
				</div>
			</div>
		</div>
	</div><!-- end: fh5co-parallax -->



	<div id="fh5co-work-section">
		<div class="container">
			<div class="row text-center">
			
			
				<form id="search-container" action="#">
					<input type="hidden" id="page" >
					<select name="searchCategori" class="form1">
						<option value="address">주소</option>
						<option value="storeName">매장명</option>
					</select>
					<input name="content" type="text" placeholder="내용을 입력해주세요" class="form2"/>
					<button class="form3" type="submit">검색</button>
				</form>
			
				<div class="btnContainer">
					<button class="storeCategori storeDTypeDefualt" type="button" onclick="changeDetails()">전체</button>
					<c:forEach var="dto" items="${storeType }">
						<button class="storeCategori storeDType${dto.store_dtype} }" onclick="changeDetailsOnClick('${dto.store_dtype}')">${dto.store_dname}</button>
					</c:forEach>
				</div>
			
				
				<div id="storeLists"></div>


			</div>
		</div>
	</div>
	
	
	
	<div id="pagination"></div>
	
	
	
	
	
	
	
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
<script>
$(document).ready(function(){
	getJackson(); //json
});
var jsonObj = "";
var l;
	
function changeDetails() {
	var types = jsonObj.store_types[${store_type} - 1];
	var dtypes = types.store_dtypes;
	l = dtypes.length;
	var ll;
	var result = "";
	for(i = 0; i < l; i++){
		var dname = dtypes[i].store_dname;
		ll = dtypes[i].stores.length;
		for(j = 0; j < ll; j++){
			
			// result += "<c:forEach var='dto' items='${list }'>";
			result += "<div class='col-md-4 col-sm-6'>";
			result += "<div class='fh5co-grid-work'>";
			result += "<div class='work-holder'>";
				var uidUrl = "storeDetail.nmj?store_uid=" + dtypes[i].stores[j].store_uid;
			result += "<a href='" + uidUrl;
			result += "'>";
		
		if(dtypes[i].stores[j].store_img_sav == null) {
			result += "<img src = '${pageContext.request.contextPath}/img/store/storeDefault.jpeg'>";
		} else {
			result += "<img src='${pageContext.request.contextPath}/img/store/" + dtypes[i].stores[j].store_img_sav + "'>";			}
			
			result += "</a>";
			result += "<a href='storeDetail.nmj?store_uid=" + dtypes[i].stores[j].store_uid + "' class='inner-overlay'>";
			result += "<i class='icon-plus'></i></a>";
			result += "</div>";
			result += "<div class='desc'>";
			result += "<h3>";
			result += "<a href='storeDetail.nmj?store_uid=" + dtypes[i].stores[j].store_uid + "'>";
			result += dtypes[i].stores[j].store_name;
			result += "</a></h3>";
			result += "<span>" + dname + "</span>";
			result += "</div></div></div>";
		//	result += "</c:forEach>";
			
		}
	}
	$("div#storeLists").html(result);
}

function changeDetailsOnClick(DTYPE){
	//TODO
	var types = jsonObj.store_types[${store_type} - 1];
	var dtypes = types.store_dtypes;
	l = dtypes.length;
	var ll;
	var result = "";
	for(i = 0; i < l; i++){
		var dname = dtypes[i].store_dname;
		ll = dtypes[i].stores.length;
		//ajax의 dtype과 버튼의 dtype이 일치할때
		if(dtypes[i].store_dtype == DTYPE){
			for(j = 0; j < ll; j++){
				//TODO
				result += "<div>";
				result += "" + dname + ": " + dtypes[i].stores[j].store_name + ":" + dtypes[i].stores[j].store_img_sav;
				result += "</div>";
				
			}
			$("div#test").html(result);
			return;
		}
	}
}
function getJackson(){
	$.ajax({
		url : "${pageContext.servletContext.contextPath}/memberAjax/dtypeList.ajax",
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				jsonObj = data;
				changeDetails();
			}
		}
	})
}
</script>
</html>