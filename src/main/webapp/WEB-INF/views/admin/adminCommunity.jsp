<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>커뮤니티관리</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
<hr>
<h2>커뮤니티관리</h2>
            
	<c:choose>
	<c:when test="${empty list || fn.length(list) == 0 }">
		데이터가 없습니다<br>
	</c:when>
	
	<c:otherwise>
      <table>
          <tr>
            <th>no.</th>
            <th>매장종류</th>
            <th>매장명</th>
            <th>내용</th>
            <th>아이디</th>
            <th>조회수</th>
            <th>작성일</th>
            <th>삭제</th>
          </tr>

	<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.review_uid }</td>
			<c:choose>
				<c:when test="${dto.store_type == 1 }">
					<td>놀자</td>
				</c:when>
				<c:when test="${dto.store_type == 2 }">
					<td>먹자</td>
				</c:when>
				<c:otherwise>
					<td>자자</td>
				</c:otherwise>
			</c:choose>
			
			<td>${dto.store_name }</td>
			<td><a href="adminCommunityInfo.nmj?review_uid=${dto.review_uid }">${dto.review_content }</a></td>
			<td>${dto.mb_id }</td>
			<td>${dto.review_viewCount }</td>
			<td>${dto.review_date }</td>
			<td><button onclick="location.href='deleteReview.nmj?review_uid=${dto.review_uid}'">삭제</button></td>
		</tr>					
	</c:forEach>
      </table>
    </c:otherwise>
</c:choose>

</body>
</html>