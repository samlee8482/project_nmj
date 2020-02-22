<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>매장 음식 관리</title>
</head>
<body>
	<!-- 내 매장에 등록된 음식 보여주기  
	음식 고유 번호 food_uid
	음식 사진 저장명  food_img_sav
	음식 가격 food_price
	음식 명 food_name
	 -->
	 <button type="button" onclick="location.href = 'storeMyFoodInsert.nmj?store_uid=${store_uid}'">음식 추가</button>
	 <ul class="foodList">
	 </ul>
	 
	 
</body>
<script>
$(document).ready(function(){
	
	getJackson(); //json
});
var jsonObj = "";
var l;
	
function changeDetails() {
	var food = jsonObj;
	l = food.length;
	var result = "";
	for(i = 0; i < l; i++){
		
		result += "<li>";
		result += "" + food[i].food_name + " : " + food[i].food_price + "원";
		result += "<button type='button' onclick='location.href=\"storeMyFoodUpdate.nmj?food_uid=" + food[i].food_uid + "\"'>수정</button>";
		result += "<button type='button' onclick=\"chkDelete('" + food[i].food_name +"', '" + food[i].food_uid + "')\">삭제</button>";
		result += "</li>";
	}
	
	$("ul.foodList").html(result);
	
}

function chkDelete(food_name, food_uid){
	var r = confirm("'" + food_name + "'을 삭제하시겠습니까?");
	if(r){
		location.href = "storeMyFoodDelete.nmj?food_uid=" + food_uid;
	} else{
		
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
				changeDetails();
			}
		}
	})
}
</script>
</html>