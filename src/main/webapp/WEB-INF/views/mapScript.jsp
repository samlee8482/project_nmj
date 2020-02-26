<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=241e9154c601bbf9fb3d6d3a33e4af25"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
//////////////////////////////
//////////////////////////////
//////////////////////////////지도 생성하기
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.499960, 127.035512), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	
	
//////////////////////////////
//////////////////////////////
//////////////////////////////이동 시키기
	function panTo() {
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(33.450701, 126.570667);
	    
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);            
	}
	
	function setCenter() {            
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(33.452613, 126.570888);
	    
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	}
	
	
	
//////////////////////////////
//////////////////////////////
////////////////////////////// 컨트롤 확대축소 
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	
	
//////////////////////////////
//////////////////////////////
////////////////////////////// 현재위치로 이동
	function findGPS() {
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        
		        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            message = ''; // 인포윈도우에 표시될 내용입니다
		        
		        // 마커와 인포윈도우를 표시합니다
		        displayMarker(locPosition, message);
		            
		      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
		    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
		        message = 'geolocation을 사용할수 없어요..'
		        
		    displayMarker(locPosition, message);
		}

	}
	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	}    
	
	
//////////////////////////////
//////////////////////////////
////////////////////////////// 마커 표시
	$(document).ready(function(){
		getJackson(); //json
	});
	var jsonObj = "";
	var l;
	var t;
	var points;
	var markers = null;
	// 모든 매장 정보 받아오는 함수
	function getJackson(){
		$.ajax({
			url : "${pageContext.servletContext.contextPath}/memberAjax/dtypeList.ajax",
			type : "GET",
			cache : false,
			success : function(data, status){
				if(status == "success"){
					jsonObj = data;
				}
			}
		})
	}
	
	// 매장 상세 종류 목록 변경
	function changeDtype(type) {
		dtypes = jsonObj.store_types[type - 1].store_dtypes;
		l = dtypes.length;
		t = type;
		result = "";
			result += "<ul>";
		for( i = 0; i < l; i++){
			result += "<li id='\"" + dtypes[i].store_dtype +"\"' onclick='changeMarkers(\"" + dtypes[i].store_dtype +"\")'>";
			result += "<span>";
			result += "" + dtypes[i].store_dname;
			result += "</span>";
			result += "</li>";
		}
			result += "</ul>";
		$("div.sub-category").html(result);
	}
	
	// 특정 상세 종류 클릭시 매장 위도 경도 points변수에 담기
	function changeMarkers(dtype){
		dtypes = jsonObj.store_types[t - 1].store_dtypes;
		l = dtypes.length;
		
		// 선택한 매장 상세 종류에 있는 모든 매장 stores에 담기.
		var stores;
		for(i = 0; i < l; i++){
			if(dtypes[i].store_dtype == dtype){
				stores = dtypes[i].stores;
				break;
			}
		}
		
		// 마커 초기화 및 새로 불러오기
		points = [];
		if (markers == null){
			markers = [];
		} else {
			setNull(markers);			
			markers = [];
		}
		l = stores.length;
		for(i = 0; i < l; i++){
			points[i] = new kakao.maps.LatLng(stores[i].store_lat, stores[i].store_long);
			markers[i] = new kakao.maps.Marker({
				position: points[i]
			});
			markers[i].setMap(map);
		}
		
		
	}
	
	function setNull(markers){
		for (i = 0; i < markers.length; i++){
			markers[i].setMap(null);
		}
	}
//////////////////////////////
//////////////////////////////
//////////////////////////////
//////////////////////////////
//////////////////////////////
//////////////////////////////
//////////////////////////////
//////////////////////////////
//////////////////////////////
</script>