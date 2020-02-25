<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
		<div><button class="doDel img_uid${list.space_img_uid }" onclick="location.href='storeMySpaceImgDelete.nmj?space_img_uid=${list.space_img_uid}&space_uid=${list.space_uid }'">삭제하기</button></div>
	</div>
	</c:forEach>
	<div>
		<button id="imgInsert">사진 추가하기</button>
	</div>
</body>
<script>
$(document).ready(function(){
	 $("#imgInsert").click(function(){
		
		 window.open("storeMySpaceImgInsert.nmj?space_uid=${space_uid}" , "매장 이미지 넣기"	, "width=400, height=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		 
	 }); 
 });
</script>
</html>