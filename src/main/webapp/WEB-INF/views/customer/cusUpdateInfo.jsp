<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 회원 정보 수정</title>
</head>
<body>

<h1>회원 정보 수정</h1>

<form name="frm" method="post" enctype="Multipart/form-data" action="cusUpdateInfoOk.nmj">
<input type="hidden" name="mb_uid" value="${mb_uid }">
프로필 사진 : <img src="${pageContext.servletContext.contextPath}/img/member/${myPage.mb_img_sav }"><br>
이름 : <input type="text" name="mb_name" placeholder="회원이름" value="${myPage.mb_name }"><br>
연락처 : <input type="text" name="mb_tel" placeholder="회원연락처" value="${myPage.mb_tel }"><br>
아이디 : <input type="text" name="mb_id" placeholder="회원아이디" value="${myPage.mb_id }" disabled><br>
비밀번호 : <input type="text" name="mb_pw" placeholder="회원비밀번호" value="${myPage.mb_pw }"><br>
이메일 : <input type="text" name="mb_email" placeholder="회원이메일" value="${myPage.mb_email }"><br>
프로필 이미지 변경 : <input type="file" name="upload" accept="image/*">
<input type="submit">
</form>


</body>
</html>