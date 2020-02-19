<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 내가 쓴 리뷰& 댓글 보기</title>
<style>
table, th, td{
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>

<h1>내가 쓴 리뷰</h1>
<table>
	<tr>
		<th>No.</th>
		<th>매장</th>
		<th>제목</th>
		<th>조회수</th>
		<th>등록일</th>
	</tr>
	<tr>
	<c:if test="${not empty myPageReview}">
		<tr>
			<c:forEach var="item" items="${myPageReview}" varStatus="status">
				<td>${status.index + 1}</td>
				<td>${item[0].store_name }</td>
				<td><a href="#">${item[0].review_content }</a></td>
				<td>${item[0].review_viewCount }</td>
				<td>${item[0].review_date }</td>
			</c:forEach>
		</tr> 
	</c:if>
	<c:if test="${myPageReview[0] == null }">
		<tr>
			<td colspan="5">작성한 기록이 없습니다.</td>
		</tr>
	</c:if>			
</table>

<h1>내가 쓴 댓글</h1>
<table>
	<tr>
		<th>No.</th>
		<th>내가 쓴 댓글</th>
		<th>해당 글</th>
		<th>등록일</th>
	</tr>
	<tr>
	<c:if test="${not empty myPageReply}">
		<tr>
			<c:forEach var="item" items="${myPageReply}" varStatus="status">
				<td>${status.index + 1}</td>
				<td>${item[0].reply_content }</td>
				<td><a href="#">${item[0].review_content }</a></td>
				<td>${item[0].reply_date }</td>
			</c:forEach>
		</tr> 
	</c:if>
	<c:if test="${myPageReply[0] == null }">
		<tr>
			<td colspan="4">작성한 기록이 없습니다.</td>
		</tr>
	</c:if>			
</table>

</body>
</html>