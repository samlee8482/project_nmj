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
	1. store_tel (정규 표현식 js 검증)
	2. store_hours (st_start~st_end) = store_hours
	3. store_content
	4. store_img_org / store_img_sav (업로드시 이미지 확장자로 보이게(html) + 확장자 검증후 db저장(java))
	 -->
	 
 <form name="frm" action="storeSettingsOk.nmj" method="post" onsubmit="return chkUpdate()" enctype="Multipart/form-data">
 	전화번호: <input type="text" name="store_tel" value="${result.store_tel}">
 	<br>
 	
 	영업시간:
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
	- 
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
	<br>
	
 	매장 설명 : <textarea name="store_content" rows="10" cols="40">${result.store_content}</textarea>
 	<br>
 	
 	매장 사진: 
 	<img src="${pageContext.servletContext.contextPath}/img/store/${result.store_img_sav}">
 	<br>
 	<input type="file" name="upload" accept="image/*">
 	
 	<br>
 	<button type="submit">수정</button>
 	<button type="button" onclick="history.back()">이전</button>
 </form>
</body>
</html>