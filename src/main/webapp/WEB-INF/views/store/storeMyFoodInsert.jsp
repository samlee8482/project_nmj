<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>음식 추가</title>
</head>
<body>
	 
 <form name="frm" action="storeMyFoodInsertOk.jsp" method="post" onsubmit="return chkUpdate()" enctype="Multipart/form-data">
 	<input type="hidden" name="store_uid" value="${store_uid}">
 	음식 이름: <input type="text" class="food_name" name="food_name" value="">
 	<br>
 	
 	음식 가격 : <input type="text" name="food_price" value="">
 	<br>
 	
 	음식 사진: 
 	<br>
 	<input type="file" name="upload" accept="image/*">
 	
 	<br>
 	<button type="submit">음식 추가</button>
 	<button type="button" onclick="history.back()">이전</button>
 </form>
</body>
<script>
$(document).ready(function(){
	getJackson(); //json
});
var jsonObj = "";
var l;
function chkUpdate(){
	food = jsonObj;
	l = food.length;
	var name = $("input.food_name").val();
	for(i = 0; i < l; i++){
		if(food[i].food_name === name){
			alert("이미 추가된 음식입니다.");
			$("input.food_name").focus();
			return false;
		}
		
	}
}	
function getJackson(){
	$.ajax({
		url : "${pageContext.servletContext.contextPath}/ajax/store/foodList.ajax/${store_uid}",
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				jsonObj = data;
			}
		}
	})
}
</script>
</html>