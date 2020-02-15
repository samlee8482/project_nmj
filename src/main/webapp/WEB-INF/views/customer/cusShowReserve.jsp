<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 예약/찜 목록 보기</title>
<style>
table, th, td{
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>

<h1>놀자 예약목록</h1>
<table>
	<tr>
		<th>No.</th>
		<th>매장</th>
		<th>시작시간</th>
		<th>종료시간</th>
		<th>인원수</th>
		<th>좌석</th>
	</tr>
	<tr>
	<c:if test="${myPageReservation.store_type == 1}">
		<tr>
			<c:forEach var="item" items="${myPageReservation}" varStatus="status">
				<td>${status.index + 1}</td>
				<td>${item.store_name }</td>
				<td>${item.store_start }</td>
				<td>${item.store_end }</td>
				<td>${item.reservation_count }</td>
				<td>${item.reservation_seat }</td>
			</c:forEach>
		</tr> 
	</c:if>
	<c:if test="${myPageReservation.store_type == null }">
		<tr>
			<td colspan="6">예약 기록이 없습니다.</td>
		</tr>
	</c:if>			
</table>

<h1>먹자 예약목록</h1>
<table>
	<tr>
		<th>No.</th>
		<th>매장</th>
		<th>예약시간</th>
		<th>인원수</th>
		<th>좌석</th>
	</tr>
	<tr>
	<c:if test="${myPageReservation.store_type == 2}">
		<tr>
			<c:forEach var="item" items="${myPageReservation}" varStatus="status">
				<td>${status.index + 1}</td>
				<td>${item.store_name }</td>
				<td>${item.store_start }</td>
				<td>${item.reservation_count }</td>
				<td>${item.reservation_seat }</td>
			</c:forEach>
		</tr> 
	</c:if>
	<c:if test="${myPageReservation.store_type == null }">
		<tr>
			<td colspan="5">예약 기록이 없습니다.</td>
		</tr>
	</c:if>			
</table>

<h1>자자 예약목록</h1>
<table>
	<tr>
		<th>No.</th>
		<th>매장</th>
		<th>시작시간</th>
		<th>종료시간</th>
		<th>인원수</th>
		<th>방</th>
	</tr>
	<c:if test="${myPageReservation.store_type == 3}">
		<tr>
			<c:forEach var="item" items="${myPageReservation}" varStatus="status">
				<td>${status.index + 1}</td>
				<td>${item.store_name }</td>
				<td>${item.store_start }</td>
				<td>${item.store_end }</td>
				<td>${item.reservation_count }</td>
				<td>${item.reservation_seat }</td>
			</c:forEach>
		</tr> 
	</c:if>
	<c:if test="${myPageReservation.store_type == null }">
		<tr>
			<td colspan="6">예약 기록이 없습니다.</td>
		</tr>
	</c:if>			
</table>

<h1>찜</h1>
<table>
	<tr>
		<th>No.</th>
		<th>매장</th>
		<th>분류</th>
	</tr>
	<c:if test="${not empty myPageLike}">
		<tr>
			<c:forEach var="item" items="${myPageLike}" varStatus="status">
				<td>${status.index + 1}</td>
				<td>${item.store_name }</td>
				<td>${item.store_type }</td>
			</c:forEach>
		</tr> 
	</c:if>
	<c:if test="${empty myPageLike }">
		<tr>
			<td colspan="3">찜한 기록이 없습니다.</td>
		</tr>
	</c:if>			
</table>

</body>
</html>