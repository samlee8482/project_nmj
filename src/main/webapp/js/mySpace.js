
var draggcnt = 0;
 var cntpc = 0;
 var cntkar = 0;
 var cntbil = 0;
 var cntbowl = 0;
 var cnttable = 0;
 var cntroom = 0;
 var spaceList_uid = new Array();
 var space_price = new Array();
 var space_count = new Array();
 var space_name = new Array();
 var space_xloc = new Array();
 var space_yloc = new Array();
 $(window).load(function(){
	  $("#addButton").click(function(){
		 var html = "";
		 var selectBox = $("#space_type").val();
		 var spaceNum = $("#spaceNum").val();
		 var spaceName = $("#spaceName").val();
		 var spacePrice = $("#spacePrice").val();
		 var draggString;
		 var boxListString = "";
		 draggcnt ++;
		 switch(selectBox){
		 case '1':
			 draggString = "#draggablepc";
			 html += '<div id="draggablepc'+ draggcnt + '" class="draggablepc ui-widget-content " style="width: ' + 50*spaceNum + 'px">';

			 for(var i = 0; i < spaceNum ; i++){
				 cntpc++;
				 html += '<div class="draggbox pcspecial pcspace space_count#' + 1 + ' space_price#' + spacePrice + ' spaceName#' + spaceName + ' spaceList#1" style="float:left"><div class="pcspaceimg" ></div><div class="pcNum">'+ cntpc + '번 좌석</div></div>';
			 }	
			 html +=  '</div>';
			 break;
		 case '2':
			 cntkar++;
			 draggString = "#draggablekar";
			 html += '<div id="draggablekar'+ draggcnt + '" class="draggablekar draggbox ui-widget-content space_count#' + spaceNum + ' space_price#' + spacePrice + ' spaceName#' + spaceName + ' spaceList#2"><div class="karspaceimg"></div><div class="karNum">'+ cntkar + '번 방</div></div>';
			 break;
		 case '3':
			 cntbil++;
			 draggString = "#draggablebil";
			 html += '<div id="draggablebil'+ draggcnt + '" class="draggablebil draggbox ui-widget-content space_count#' + spaceNum + ' space_price#' + spacePrice + ' spaceName#' + spaceName + ' spaceList#3"><div class="bilspaceimg"></div><div class="bilNum">' + cntbil + '번 당구대</div></div>';
			 break;
		 case '4':
			 cntbowl++;
			 draggString = "#draggablebowl";
			 html += '<div id="draggablebowl'+ draggcnt + '" class="draggablebowl draggbox ui-widget-content space_count#' + spaceNum + ' space_price#' + spacePrice + ' spaceName#' + spaceName + ' spaceList#4"><div class="bowlspaceimg"></div><div class="bowlNum">' + cntbowl +'번 레일</div></div>';
			 break;
		 case '5':
			 cnttable++;
			 draggString = "#draggableTable";
			 html += '<div id="draggableTable'+ draggcnt + '" class="draggableTable draggbox ui-widget-content space_count#' + spaceNum + ' space_price#' + spacePrice + ' spaceName#' + spaceName + ' spaceList#5"><div class="tablespaceimg"></div><div class="tableNum">' + cnttable + '번 테이블</div></div>';
			 break;
		 default:
			 cntroom++;
			 draggString = "#draggableRoom";
   		 	 html += '<div id="draggableRoom'+ draggcnt + '" class="draggableRoom draggbox ui-widget-content space_count#' + spaceNum + ' space_price#' + spacePrice + ' spaceName#' + spaceName + ' spaceList#' + selectBox + '"><div class="roomspaceimg"></div><div class="roomNum">' + cntroom + '번 방</div></div>';
			 break;
		 }
		 $("#boxMakingArea").append(html);
		 var makeDragg = draggString + draggcnt;
		 $(makeDragg).draggable({containment: "#draggArea"});
		 
		 if(cntpc != 0){
			 boxListString += "<div>총 PC 좌석 수 : " + cntpc + "석</div>";
		 }if(cntkar != 0){
			 boxListString += "<div>총 노래방 수 : " + cntkar + "개</div>";
		 }if(cntbil != 0){
			 boxListString += "<div>총  당구대 수 : " + cntbil + "개</div>";
		 }if(cntbowl != 0){
			 boxListString += "<div>총 볼링 레일 수 : " + cntbowl + "개</div>";
		 }if(cnttable != 0){
			 boxListString += "<div>총 테이블 수 : " + cnttable + "개</div>";
		 }if(cntroom != 0){
			 boxListString += "<div>총 방 수 : " + cntroom + "개</div>";
		 }
		 boxListString += '<button id="confirmbtn" type="button" class="btn btn-info">저장하기</button>';
		 $("#boxListArea").html(boxListString);
		 $("#confirmbtn").click(function(){
			 var i = 0;
			 $(".draggbox").each(function(){
				 var text = $(this).attr('class');
				 var positionX = $(this).css('left');
				 var positionY = $(this).css('top');
				 var elements = text.split(" ");
				 space_count[i] = elements[3].split("#")[1];
				 space_price[i] = elements[4].split("#")[1];
				 space_name[i] = elements[5].split("#")[1];
				 spaceList_uid[i] = elements[6].split("#")[1];
				 space_xloc[i] = positionX.split("px")[0];
				 space_yloc[i] = positionY.split("px")[0];				 
				 i++;
			 });
			 for(var j = 0; j < i ; j++){
				 $.ajax({
					 url : "/nmj/store/space.ajax",
					 type : "POST",
					 cache : false,
					 data : {
						 "store_uid" : store_uid,
						 "spaceList_uid" : spaceList_uid[j],
						 "space_count" : space_count[j],
						 "space_price" : space_price[j],
						 "space_name" : space_name[j],
						 "space_xloc" : space_xloc[j],
						 "space_yloc" : space_yloc[j]
					 },
					 success : function(data, status){
						 if(status == "success"){
							 alert("성공");
						 }
						 else{
							 alert("실패");
						 }
					 }
				 });					 
			 }
		 });
	});
	  
});
	  
     