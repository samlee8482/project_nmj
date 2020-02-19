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
<title>매장회원정보</title>
</head>

<header >
	<h2>매장회원 정보</h2>
</header>
	<div style="text-align:left;">
	<u><strong>이름</strong></u><br> ${dto.mb_name } <br><br>
	<u><strong>아이디</strong></u><br> ${dto.mb_id } <br><br>
	<u><strong>연락처</strong></u><br> ${dto.mb_tel } <br><br>
	<u><strong>이메일</strong></u><br> ${dto.mb_email } <br><br>
	<u><strong>가입날짜</strong></u><br> ${dto.mb_regDate } <br><br>
	<u><strong>매장종류</strong></u><br> 
		<c:choose>
			<c:when test="${dto2.store_type == 1 }">
				놀자
			</c:when>
			<c:when test="${dto2.store_type == 2 }">
				먹자
			</c:when>
			<c:otherwise>
				자자
			</c:otherwise>
		</c:choose>
	<br><br>
	<u><strong>매장이름</strong></u><br> ${dto2.store_name }  <br><br>
	<u><strong>매장주소</strong></u><br> ${dto2.store_address } <br><br>
	<u><strong>매장연락처</strong></u><br> ${dto2.store_tel }<br><br>
	<u><strong>매장영업시간</strong></u><br> ${dto2.store_hours }<br><br>
	<u><strong>매장설명</strong></u><br> ${dto2.store_content }<br>
	<br>
	</div>
	
	<button onclick="location.href='adminStore.nmj'">목록보기</button>

</body>
</html>

	</c:otherwise>
</c:choose>