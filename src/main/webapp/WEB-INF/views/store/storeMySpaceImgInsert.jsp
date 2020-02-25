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
	<form name="frm" action="storeMySpaceImgInsertOk.nmj" method="post" enctype="Multipart/form-data">
		<c:forEach var="list" items="${space_uid}">
			<input type="hidden" name="space_uid" value="${list }">
		</c:forEach>
		<input type="file" name="upload" accept="image/*">	
		<button type="submit">등록</button>
	</form>
</body>
</html>