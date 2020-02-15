<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 세션있는 버전. 추후 이걸로 바꿔야함. 현재 세션값 안받아오므로 아래처럼 바로 '회원정보수정'페이지로 넘어감 <button onclick="location.href='cusUpdateInfoAction.nmj'">회원 정보 수정</button> -->
<button onclick="location.href='cusUpdateInfo.nmj?mb_uid=5'">회원 정보 수정</button>
<button onclick="location.href='cusShowReserve.nmj'">예약/찜 목록 보기</button>
<button onclick="location.href='cusShowReview.nmj'">내 리뷰 보기</button>

</body>
</html>