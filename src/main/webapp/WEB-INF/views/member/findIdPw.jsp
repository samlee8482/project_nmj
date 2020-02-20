<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
</head>
<script>
// form 검증
function chkSubmit1(){
	frm1 = document.forms["frm1"];
	
	var mb_id = frm1["mb_id"].value.trim();
	var mb_pw = frm1["mb_pw"].value.trim();
	var mb_name = frm1["mb_name"].value.trim();
	var mb_email = frm1["mb_email"].value.trim();
	
	if(mb_name == ""){
		alert("이름을 입력해주세요.");
		frm1["mb_name"].focus();
		return false;
	}
	if(mb_email == ""){
		alert("이메일을 입력해주세요.");
		frm1["mb_email"].focus();
		return false;
	}
	
	return true;
}

function chkSubmit2(){
	frm2 = document.forms["frm2"];
	
	var mb_id = frm2["mb_id"].value.trim();
	var mb_name = frm2["mb_name"].value.trim();
	var mb_email = frm2["mb_email"].value.trim();
	
	if(mb_id == ""){
		alert("아이디를 입력해주세요.");
		frm2["mb_id"].focus();
		return false;
	}
	if(mb_name == ""){
		alert("이름을 입력해주세요.");
		frm2["mb_name"].focus();
		return false;
	}
	if(mb_email == ""){
		alert("이메일을 입력해주세요.");
		frm2["mb_email"].focus();
		return false;
	}
	
	return true;
}
</script>
<body>
<div class="a" id="div-find-id">
	<form name="frm1" id="find-id-content" method="post" action="findIdOk.nmj" onsubmit="return chkSubmit1()">
       <div class="find-id">
       	<h4>아이디 찾기</h4>
       </div>
       <div id="find-id" class="find-id">
       	<div id="find-id-info" class="find-id">
       		<input name="mb_name" class="find-id-info" type="text" placeholder="이름" required="required"><br>
       		<input name="mb_email" class="find-id-info" type="text" placeholder="ex)  *****@example.com" required="required">
       	</div>
       	<button type="submit" id="find-id-btn" style="background: #eb2b63; color: #ffffff;">아이디 찾기</button>
       </div>
	</form>
</div>
   
<div class="a" id="div-find-pw" style="margin-top: 125px;">
	<form name="frm2" id="find-pw-content" method="get" action="findPwOk.nmj" onsubmit="return chkSubmit2()" >
		<div class="find_pw">
			<h4>비밀번호 찾기</h4>
		</div>
		<div id="find-pw" class="find-pw">
			<div id="find-pw-info" class="find-pw">
				<input name="mb_id" class="find-pw-info" type="text" placeholder="아이디" required="required"><br>
				<input name="mb_name" class="find-pw-info" type="text" placeholder="이름" required="required"><br>
				<input name="mb_email" class="find-pw-info" type="text" placeholder="ex)  *****@example.com" required="required">
			</div>
			<button type="submit" id="find-pw-btn" style="background: #eb2b63; color: #ffffff;">비밀번호 찾기</button>
		</div>
	</form>
</div>
</body>
</html>