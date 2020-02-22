<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>매장 정보 수정 요청</title>
</head>
<body>
<!-- 매장 회원에게 권한이 없는 수정 목록
	매장 이릅 store_name
	매장 주소 store_address
	매장 사업자 등록 번호 store_regNum
	매장 사업자 등록 원본 store_regImg_org
	매장 사업자 등록 저장 store_regImg_sav
	매장 종류 store_type
	매장 상세 종류 store_dtype
	운영자에게 한마디? text
	 -->
	 
	 <form action="storeSettingsRequestOk.nmj" enctype="Multipart/form-data" method="post" onsubmit="return chkUpdate()">
	 	<input type="hidden" name="store_uid" value="${result.store_uid}">
	 	<input type="hidden" id="entY" name="st_latitude">
	 	<input type="hidden" id="entX" name="st_longitude">
	 	
	 	매장 이름 변경: <input type="text" name="store_name" value="${result.store_name}">
	 	<br>
	 	
	 	매장 주소 변경: <input type="text" id="roadFullAddr" name="roadFullAddr" value="${result.store_address}" readonly>
	 	<button type="button" onclick="goPopup();">주소찾기</button>
	 	<br>
	 	
	 	매장 사업자 등록 번호 변경: <input type="text" name="store_regNum" pattern="[0-9]{3}-[0-9]{2}-[0-9]{5}" value="${result.store_regNum}">
	 	<br>
	 	
	 	매장 사업자 등록증 변경: 
	 	<img alt="${result.store_img_sav}" src="${pageContext.servletContext.contextPath}/img/store/${result.store_regImg_sav}">
	 	<input type="file" name="upload" accept="image/*">
	 	<br>
	 	
	 	매장 종류 변경: 
	 	<select class="store_type" name="store_type" onchange="changeDetails()">
	 		<option value="${result.store_type}">${storeType}</option>
	 		<option value="1">놀자</option>
	 		<option value="2">먹자</option>
	 		<option value="3">자자</option>
	 	</select>
	 	<br>
	 	
	 	매장 상세 종류 변경: 
		<select class="store_dtype" name="store_dtype">
	 	</select>
	 	<br>
	 	
	 	변경사항에 대한 설명: <textarea maxlength="100" rows="10" cols="30" placeholder="운영자에게 한마디..."></textarea>
	 	
	 	<button type="submit">정보 수정 요청하기</button>
	 </form>
</body>
<script>
/////////////////////////////////////////////////////////////////////////////////////////////////// 상세 종류 목록 변경
$(document).ready(function(){
	
	getJackson(); //json
});
var jsonObj = "";
var l;
	
function changeDetails() {
	var type = $("select.store_type").children("option:selected").val() - 1;
	var dtypes = jsonObj.store_types[type].store_dtypes;
	l = dtypes.length;
	var result = "";
	for(i = 0; i < l; i++){
		result += "<option value='" + dtypes[i].store_dtype + "'>" + dtypes[i].store_dname + "</option>";
	}
	
	$("select.store_dtype").html(result);
	
}

function getJackson(){
	$.ajax({
		url : "${pageContext.servletContext.contextPath}/ajax/store/dtypeList.ajax",
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
//////////////////////////////////////////////////////////////////////////////////////////////	주소 api
function goPopup(){
    var pop = window.open("addressPopup.nmj","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno
						, emdNo, entX, entY){
	document.getElementById("roadFullAddr").value = roadFullAddr;
	convertCall(entX, entY);
}
function convertCall(entX, entY){
	var x = entX;
	var y = entY;
	var url ="https://dapi.kakao.com/v2/local/geo/transcoord.json?x=" + x + "&y=" + y + "&input_coord=UTM&output_coord=WGS84";
	$.ajax({
		url: url,
		headers: {'Authorization' : 'KakaoAK 241e9154c601bbf9fb3d6d3a33e4af25'},
		type: "GET",
		cache: false,
		dataType: "json",
		success: function(data, status){
			if(status == "success"){
				parseJSON(data);
			}
		}
	});
}
function parseJSON(data) {	
	var list = data.documents
	
	var entX = list[0].x;
	var entY = list[0].y;
	document.getElementById("entX").value = entX;
	document.getElementById("entY").value = entY;
}
	
	
	
	
</script>
</html>