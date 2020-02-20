<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>일반회원관리</title>
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
<h2>일반회원관리</h2>

<form name="frm" action="adminSearchMember.nmj" method="post">
<select name="searchOption">
  <option value="1">이름</option>
  <option value="2">아이디</option>
</select>
<input type="text" name="search"/>
<button type="submit">검색</button>
</form>
<br><br>
            
	<c:choose>
	<c:when test="${empty list || fn.length(list) == 0 }">
		데이터가 없습니다<br>
	</c:when>
	
	<c:otherwise>
      <table>
          <tr>
            <th>이름</th>
            <th>아이디</th>
            <th>연락처</th>
            <th>이메일</th>
            <th>회원등록일</th>
            <th>회원삭제</th>
          </tr>

	<c:forEach var="dto" items="${list}">
		<tr>
			<td><a href="adminMemberInfo.nmj?mb_uid=${dto.mb_uid }">${dto.mb_name }</a></td>
			<td>${dto.mb_id }</td>
			<td>${dto.mb_tel }</td>
			<td>${dto.mb_email }</td>
			<td>${dto.mb_regDate }</td>
			<td><button onclick="location.href='deleteMember.nmj?mb_uid=${dto.mb_uid}'">삭제</button></td>
		</tr>					
	</c:forEach>
      </table>
    </c:otherwise>
</c:choose>

</body>
</html>