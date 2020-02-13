<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 정보 수정</title>
</head>
<body>
<!-- 승인 없이 처리할 매장 정보 페이지
	1. 매장 전화 번호 2. 매장 영업 시간 3. 매장 설명 4. 매장 사진
	1. store_tel
	2. store_hours
	3. store_content
	4. store_img_org / store_img_sav
	 -->
	 
 <form name="frm" action="storeGeneralSettingOk.nmj" method="post" onsubmit="return chkUpdate()">
 	전화번호: <input type="text" name="store_tel" value="${result.store_tel}">
	<select name="st_start" id="demo-category">
		<option value="08:00">08:00</option>
		<option value="08:30">08:30</option>
		<option value="09:00">09:00</option>
		<option value="09:30">09:30</option>
		<option value="10:00">10:00</option>
		<option value="10:30">10:30</option>
		<option value="11:00">11:00</option>
		<option value="11:30">11:30</option>
	</select>
	<div>-</div> 
	<select name="st_end" id="demo-category">
		<option value="18:00">18:00</option>
		<option value="18:30">18:30</option>
		<option value="19:00">19:00</option>
		<option value="19:30">19:30</option>
		<option value="20:00">20:00</option>
		<option value="20:30">20:30</option>
		<option value="21:00">21:00</option>
		<option value="21:30">21:30</option>
		<option value="22:00">22:00</option>
		<option value="22:30">22:30</option>
	</select>
 	매장 설명 : <textarea name="store_content" rows="20" cols="20">${result.store_content}</textarea>
 	<img src="${pageContext.servletContext.contextPath}/img/store/${result.store_img_sav}">
 	
 	<button type="submit">매장 정보 수정</button>
 </form>
</body>
</html>