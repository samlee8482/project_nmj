<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${not empty sessionScope.loginUid}">
			<script>
					location.href = "cusMyPage.do?mb_uid=${sessionScope.loginUid}";
					//location.href = "cusMyPage.nmj?mb_uid=5";
			</script>
	</c:when>
	<c:otherwise>
			<script>
				alert("로그인이 필요한 화면입니다.");
				location.href = "login.nmj";
			</script>
	</c:otherwise>			
</c:choose>
