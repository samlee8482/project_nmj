
var draggcnt = 0;
 var cntpc = 0;
 var cntkar = 0;
 var cntbil = 0;
 var cntbowl = 0;
 var cnttable = 0;
 var cntroom = 0;
 $(window).load(function(){
	  $("#addButton").click(function(){
		 var html = "";
		 var selectBox = $("#space_type").val();
		 var spaceNum = $("#spaceNum").val();
		 var draggString;
		 draggcnt ++;
		 switch(selectBox){
		 case '1':
			 draggString = "#draggablepc";
			 html += '<div id="draggablepc'+ draggcnt + '" class="draggablepc ui-widget-content" style="width: ' + 50*spaceNum + 'px">';

			 for(var i = 0; i < spaceNum ; i++){
				 cntpc++;
				 html += '<div class="pcspace" style="float:left"><div class="pcspaceimg" ></div><div class="pcNum">'+ cntpc + '번 좌석</div></div>';
			 }	
			 html +=  '</div>';
			 break;
		 case '2':
			 cntkar++;
			 draggString = "#draggablekar";
			 html += '<div id="draggablekar'+ draggcnt + '" class="draggablekar ui-widget-content"><div class="karspaceimg"></div><div class="karNum">'+ cntkar + '번 방</div></div>';
			 break;
		 case '3':
			 cntbil++;
			 draggString = "#draggablebil";
			 html += '<div id="draggablebil'+ draggcnt + '" class="draggablebil ui-widget-content"><div class="bilspaceimg"></div><div class="bilNum">' + cntbil + '번 당구대</div></div>';
			 break;
		 case '4':
			 cntbowl++;
			 draggString = "#draggablebowl";
			 html += '<div id="draggablebowl'+ draggcnt + '" class="draggablebowl ui-widget-content"><div class="bowlspaceimg"></div><div class="bowlNum">' + cntbowl +'번 레일</div></div>';
			 break;
		 case '5':
			 cnttable++;
			 draggString = "#draggableTable";
			 html += '<div id="draggableTable'+ draggcnt + '" class="draggableTable ui-widget-content"><div class="tablespaceimg"></div><div class="tableNum">' + cnttable + '번 테이블</div></div>';
			 break;
		 default:
			 cntroom++;
			 draggString = "#draggableRoom";
   		 	 html += '<div id="draggableRoom'+ draggcnt + '" class="draggableRoom ui-widget-content"><div class="roomspaceimg"></div><div class="roomNum">' + cntroom + '번 방</div></div>';
			 break;
		 }
		 $("#boxMakingArea").append(html);
		 var makeDragg = draggString + draggcnt;
		 $(makeDragg).draggable({containment: "#draggArea"});
	});  
});
	  
     