<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 아래 버튼들은 현재 세션값 안받아오므로 세션없이 임의로 uid 값 넣어준 버전. 추후 세션값 넣어서 보내주는 걸로 바꿔야함. -->
<button onclick="location.href='cusUpdateInfo.nmj?mb_uid=5'">회원 정보 수정</button>
<button onclick="location.href='cusShowReserve.nmj?mb_uid=5'">예약/찜 목록 보기</button>
<button onclick="location.href='cusShowReview.nmj?mb_uid=5'">내가 쓴 리뷰&댓글 보기</button>

</body>
</html>