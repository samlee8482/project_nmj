<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<c:choose>
	<c:when test="${empty dto }">
	<script>
		alert("해당 정보가 삭제되거나 없습니다");
		history.back();
	</script>
	</c:when>
	<c:otherwise>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" type="text/css" href="CSS/main.css"/>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<title>리뷰 상세보기</title>
</head>

<header >
	<h2>리뷰 상세보기</h2>
</header>
	<div style="text-align:left;">
	<u><strong>매장종류</strong></u><br> 
		<c:choose>
			<c:when test="${dto.store_type == 1 }">
				놀자
			</c:when>
			<c:when test="${dto.store_type == 2 }">
				먹자
			</c:when>
			<c:otherwise>
				자자
			</c:otherwise>
		</c:choose>
		<br><br>
	<u><strong>매장명</strong></u><br> ${dto.store_name }  <br><br>
	<u><strong>작성자</strong></u><br> ${dto.mb_id } <br><br>
	<u><strong>내용</strong></u><br> ${dto.review_content }<br><br>
	<u><strong>조회수</strong></u><br> ${dto.review_viewCount }<br><br>
	<u><strong>작성일</strong></u><br> ${dto.review_date }<br>
	<br>
	</div>
	
	<button onclick="location.href='adminCommunity.nmj'">목록보기</button>

</body>
</html>

	</c:otherwise>
</c:choose>