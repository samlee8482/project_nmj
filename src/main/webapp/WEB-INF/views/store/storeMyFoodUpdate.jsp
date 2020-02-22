<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 수정</title>
</head>
<body>
<form name="frm" action="storeMyFoodUpdateOk.nmj" method="post" onsubmit="return chkUpdate()">
 	<input type="hidden" name="food_uid" value="${dto.food_uid}">
 	
 	음식 명: <input type="text" name="food_name" value="${dto.food_name}">
 	<br>
 	
 	음식 가격: <input type="text" name="food_price" value="${dto.food_price}">
 	<br>
 	
 	<br>
 	<button type="submit">수정</button>
 	<button type="button" onclick="history.back()">이전</button>
 </form>
</body>
</html>