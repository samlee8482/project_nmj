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
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
 
 
 
 
 <script>
//페이지 최초 로딩되면 게시글 목록 첫페이지분 로딩

 $(document).ready(function(){
 	$("input#page").val(1);	// 페이지 최초 로딩되면 1페이지
 	loadPage(1) // n Page 읽어오기



 	// [이전] 버튼 눌렀을때 -> 이전 페이지 게시글목록 로딩
 	$("button#prev").click(function(){
 		// 현재페이지 정보 가져오기
 		var curPage = parseInt($("input#page").val());
 		
 		// 첫페이지였다면..
 		if(curPage == 1) {
 			return;
 		}
 		
 		// 첫페이지 아니라면 이전페이지 로딩
 		loadPage(curPage - 1);
 		
 	});
 	
 	
 	
 	// [다음] 버튼 눌렀을때 -> 다음 페이지 게시글목록 로딩
 	$("button#next").click(function(){
 		// 현재페이지
 		var curPage = parseInt($("input#page").val());
 		loadPage(curPage + 1);	// 다음 페이지 로딩

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
 			result += list[i].store_uid+">";
 			if(list[i].store_img_sav != null){
 				result += '<img src="' + list[i].store_img_sav + '">';
 			}else{
 				result += '<img src="">';
 			}
 			result += '</a><a href="storeDetail.nmj?store_uid=' + list[i].store_uid + '" class="inner-overlay"><iclass="icon-plus"></i></a>';
 			result += '</div><div class="desc"><h3><a href="storeDetail.nmj?store_uid=' + list[i].store_uid + '">';
 			result += list[i].store_name + '</a></h3><span>' + list[i].store_dname + '</span></div></div></div>'; 
 		}
 		
 		$("#storeList").html(result); // 테이블 내용 업데이트
 		
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

	<div>
		<button class="storeCategori storeDTypeDefualt">전체</button>
		<c:forEach var="dto" items="${storeType }">
			<button class="storeCategori storeDType${dto.store_dtype} }">${dto.store_dname}</button>
		</c:forEach>
	</div>

		<div id="storeLists">
			<c:forEach var="dto" items="${list }">
				<div class="col-md-4 col-sm-6">
					<div class="fh5co-grid-work">
						<div class="work-holder">
							<a href="storeDetail.nmj?store_uid=${dto.store_uid}">
					<c:choose>
						<c:when test="${empty dto.store_img_sav }">	
							<img src = "">
						</c:when>
						<c:otherwise>
							<img src="${dto.store_img_sav }">
						</c:otherwise>
					</c:choose>
							</a>
							<a href="storeDetail.nmj?store_uid=${dto.store_uid}" class="inner-overlay"><i
									class="icon-plus"></i></a>
						</div>
						<div class="desc">
							<h3><a href="storeDetail.nmj?store_uid=${dto.store_uid}">
							${dto.store_name }</a></h3>
							<span>${dto.store_dname }</span>
						</div>
					</div>
				</div>
			</c:forEach>
				
		</div>



			</div>
		</div>
	</div>
	
	<div class="center">
		<ul class="pagination">
			<c:if test="${page eq 1 }">
				<li><button id="leftpage"></button></li>			
			</c:if>


			
				<li><button class5="pageNum choose" "></button></li>


			
			
			<c:if test="${page eq totalPage }">
				<li><button id="rightpage"></button></li>			
			</c:if>		
		</ul>
	</div>
	
	

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