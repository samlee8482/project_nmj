<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	 	<input type="hidden" name="store_uid" value="${store_uid}">
	 	매장 이름 변경: <input type="text" name="" value="">
	 	매장 주소 변경: <input type="text" name="" value="">
	 	매장 사업자 등록 번호 변경: <input type="text" name="" value="">
	 	매장 사업자 등록증 변경: <input type="text" name="" value="">
	 	매장 종류 변경: <input type="text" name="" value="">
	 	매장 상세 종류 변경: <input type="text" name="" value="">
	 	변경사항에 대한 설명: <textarea maxlength="100" rows="10" cols="30" placeholder="운영자에게 한마디..."></textarea>
	 </form>
</body>
</html>