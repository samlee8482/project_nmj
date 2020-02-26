<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<table>
	<tr>
		<th>♡</th>
		<th>놀자</th>
		<th>먹자</th>
		<th>자자</th>
	</tr>
	
	<tr>
		<td>1위</td>
		<td>${nol[0].store_name }(${nol[0].totalAvg })</td>
		<td>${muk[0].store_name }(${muk[0].totalAvg })</td>
		<td>${ja[0].store_name }(${ja[0].totalAvg })</td>
	</tr>
	<tr>
		<td>2위</td>
		<td>${nol[1].store_name }(${nol[1].totalAvg })</td>
		<td>${muk[1].store_name }(${muk[1].totalAvg })</td>
		<td>${ja[1].store_name }(${ja[1].totalAvg })</td>
	</tr>
	<tr>
		<td>3위</td>
		<td>${nol[2].store_name }(${nol[2].totalAvg })</td>
		<td>${muk[2].store_name }(${muk[2].totalAvg })</td>
		<td>${ja[2].store_name }(${ja[2].totalAvg })</td>
	</tr>
	
</table>

<br><br><br><br>
<table>
	<tr>
		<th>회원이름</th>
		<th>내용</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
	<tr>
		<td>${community[0].mb_id }</td>
		<td>${community[0].review_content }</td>
		<td>${community[0].review_date }</td>
		<td>${community[0].review_viewCount }</td>
	</tr>
	<tr>
		<td>${community[1].mb_id }</td>
		<td>${community[1].review_content }</td>
		<td>${community[1].review_date }</td>
		<td>${community[1].review_viewCount }</td>
	</tr>
	<tr>
		<td>${community[2].mb_id }</td>
		<td>${community[2].review_content }</td>
		<td>${community[2].review_date }</td>
		<td>${community[2].review_viewCount }</td>
	</tr>
	<tr>
		<td>${community[3].mb_id }</td>
		<td>${community[3].review_content }</td>
		<td>${community[3].review_date }</td>
		<td>${community[3].review_viewCount }</td>
	</tr>
	<tr>
		<td>${community[4].mb_id }</td>
		<td>${community[4].review_content }</td>
		<td>${community[4].review_date }</td>
		<td>${community[4].review_viewCount }</td>
	</tr>
	


</table>


<br><br><br><br>
<table>
	<tr>
		<th>회원이름</th>
		<th>내용</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
	<tr>
		<td>${community[0].mb_name }</td>
		<td>${community[0].review_content }</td>
		<td>${community[0].review_date }</td>
		<td>${community[0].review_viewCount }</td>
	</tr>
	<tr>
		<td>${community[1].mb_name }</td>
		<td>${community[1].review_content }</td>
		<td>${community[1].review_date }</td>
		<td>${community[1].review_viewCount }</td>
	</tr>
	<tr>
		<td>${community[2].mb_name }</td>
		<td>${community[2].review_content }</td>
		<td>${community[2].review_date }</td>
		<td>${community[2].review_viewCount }</td>
	</tr>
	<tr>
		<td>${community[3].mb_name }</td>
		<td>${community[3].review_content }</td>
		<td>${community[3].review_date }</td>
		<td>${community[3].review_viewCount }</td>
	</tr>
	<tr>
		<td>${community[4].mb_name }</td>
		<td>${community[4].review_content }</td>
		<td>${community[4].review_date }</td>
		<td>${community[4].review_viewCount }</td>
	</tr>
	


</table>






</body>
</html>