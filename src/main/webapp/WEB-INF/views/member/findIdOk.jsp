<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<c:choose>
	<c:when test="${empty findIdOk }">
		<script>
			alert("아이디 찾기 실패");
			history.back();
		</script>  
	</c:when>
	<c:when test="${not empty findIdOk }">
		<script>
			alert("아이디 찾기 성공");
		</script>
	</c:when>
</c:choose>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 성공</title>
</head>
<body>

<div id="div_find-id">
	<div class="find-id">
		<h3>아이디 찾기</h3>
	</div>
	<div id="find-id" class="find-id">
		<div id="find_id-info" class="find-id" style="border: none;">
			회원님께서 찾으시는 아이디는 <br>
			<div name="mb_name" class="find-id-info" type="text" placeholder="이름" required="required">'${findIdOk}'입니다.</div><br>
			
			다시 로그인 해주시기 바랍니다.<br>
		</div>
		<button id="login-btn" onclick="location.href='login.nmj'" style="background: #eb2b63; color: #ffffff;">로그인</button>
	</div>
</div>

</body>
</html>