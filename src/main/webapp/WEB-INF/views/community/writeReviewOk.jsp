<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("작성 실패");
			history.back();
		</script>
	</c:when>
	<c:when test="${result == 1}">
		<c:choose>
			<c:when test="${rate == 1 }">
				<script>
					alert("리뷰 작성 성공");
					location.href = "communityList.nmj?mb_uid=${mb_uid }";
				</script>
			</c:when>
			<c:otherwise>
				<script>
					alert("글 작성 성공");
					location.href = "communityList.nmj?mb_uid=${mb_uid }";
				</script>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:when test="${result == 2 }">
		<script>
			alert("수정 실패");
			history.back();
		</script>
	</c:when>
	<c:when test="${result == 3 }">
		<script>
			alert("수정 성공");;
			location.href = "communityView.nmj?review_uid=${location }";
		</script>
	</c:when>
</c:choose>