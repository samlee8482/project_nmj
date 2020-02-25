<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #feedback { font-size: 1.4em; }
  #selectable .ui-selecting { background: #FECA40; }
  #selectable .ui-selected { background: #F39814; color: white; }
  #selectable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
  #selectable li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 18px; }
  </style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
</head>
<body>

<p id="feedback">
<span>고르신 공간 : </span> <span id="select-result">없음</span>.
<form id="space_uids" action="storeMySpaceImgInsert.nmj" method="post">
	<button id="imgAllInsert">이미지 넣기</button>
</form>


</p>
<div>
	<div>
	<ol id="selectable">
		<c:forEach var="list" items="${space }">
			<li class="space_uid${list.space_uid } ui-widget-content">
				<a href="storeImgDetail.nmj?space_uid=${list.space_uid }">${list.space_name }</a> 
			</li>
		</c:forEach>
		</ol>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
$( function() {
    $( "#selectable" ).selectable({
      stop: function() {
        var result = $( "#select-result" ).empty();
     
        var uidsText = "";
        $( ".ui-selected", this ).each(function() {
          var index = $( "#selectable li" ).index( this );
          var text = $( "#selectable li" ).get(index).innerText;
          var space_uidText = $("#selectable li").get(index).innerHTML;
          space_uid = space_uidText.split("=")[2];
          space_uid = space_uid.split('"')[0];
          uidsText += "<input type='hidden' name='space_uid' value='" + space_uid + "'>";
          result.append(text+ " ");
        });
        uidsText += "<button id='imgAllInsert'>이미지 넣기</button>";
        $("#space_uids").html(uidsText);
      }
    });
  } );
  $(document).ready(function(){
	 $("#imgAllInsert").click(function(){
		 location.href="storeMySpaceImgInsert?space_uid="+ space_uids;
	 }); 
  });
  </script>
</html>