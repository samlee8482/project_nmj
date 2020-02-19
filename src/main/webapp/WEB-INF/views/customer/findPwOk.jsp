<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<c:choose>  
	<c:when test="${empty findPwOk }">
		<script>
			alert("비밀번호 찾기 실패");
			history.back();
		</script>  
	</c:when>
	<c:when test="${not empty findPwOk }">
		<script>
			alert("비밀번호 찾기 성공");
		</script>
	</c:when>
</c:choose>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 성공</title>
</head>
<body>

<div class="a" id="div_find-id">
	<div class="find-id">
		<h3>비밀번호 찾기</h3>
	</div>
	<div id="find-id" class="find-id" style="border: none;">
		<div id="find_id-info" class="find-id">
			<div name="mb_name" class="find-id-info" type="text" required="required">고객님의 이메일로<br>비밀번호가 발송되었습니다.</div><br>
		</div>
		<button id="login-btn" onclick="location.href='login.nmj'" style="background: #eb2b63; color: #ffffff;">로그인</button>
	</div>
</div>

</body>
</html>