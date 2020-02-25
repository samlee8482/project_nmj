$(document).ready(function(){

	var chk = true;
	
    $("b#menu").click(function (){
    	
    	
    	if($(".modalContainer").css("display") == "none"){
    		$(".modalContainer").css("display", "block");
    		 $("b#menu").text("메뉴판 접기");
    	} else {
    		$(".modalContainer").css("display", "none");
    		$("b#menu").text("메뉴판 펼치기");
    	}
    	
    	
    });

}); 