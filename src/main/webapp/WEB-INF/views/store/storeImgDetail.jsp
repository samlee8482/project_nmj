<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="list" items="${spaceImg }">
	<div>
		<div>
			<img style='width: 100%; height: 100%;' src='${pageContext.servletContext.contextPath}/img/store/${list.space_img_sav }'>
		</div>
		<div>
			<div>${list.space_img_sav }</div>
		</div>
		<div><button class="doDel img_uid${list.space_img_uid }">삭제하기</button></div>
	</div>
	</c:forEach>
	<div>
		<button>사진 추가하기</button>
	</div>
</body>
</html>