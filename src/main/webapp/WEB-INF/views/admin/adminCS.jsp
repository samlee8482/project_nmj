<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Customer Service</title>
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
<h2>Customer Service</h2>
            
	<c:choose>
	<c:when test="${empty list || fn.length(list) == 0 }">
		데이터가 없습니다<br>
	</c:when>
	
	<c:otherwise>
      <table>
          <tr>
            <th>no.</th>
            <th>유형</th>
            <th>내용</th>
            <th>해결여부</th>
            <th>링크</th>
          </tr>

	<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.request_uid }</td>
			<c:choose>
				<c:when test="${dto.request_type == 1 }">
					<td>가입요청</td>
				</c:when>
				<c:when test="${dto.request_type == 2 }">
					<td>수정요청</td>
				</c:when>
				<c:when test="${dto.request_type == 2 }">
					<td>게시글신고</td>
				</c:when>
				<c:otherwise>
					<td>댓글신고</td>
				</c:otherwise>
			</c:choose>
			<td>${dto.request_content }</td>
			<td>
			<button onclick="location.href='adminCSreject.nmj?request_uid=${dto.request_uid }'">거절</button>
			<button onclick="location.href='adminCSsolve.nmj?request_uid=${dto.request_uid }'">해결</button>
			</td>
			<td>링크</td>
		</tr>					
	</c:forEach>
      </table>
    </c:otherwise>
</c:choose>

</body>
</html>