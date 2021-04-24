/**
 * 
 */
$('#listgo').click(function() {
	var url = "http://localhost:8077/MyProject",
		page = $('#page').val(),
		perPageNum = $('#perPageNum').val();

	location.href = url + "/boards?" +
		"page=" + page +
		"&perPageNum=" + perPageNum;
});

$('#likebtn').click(function(){
		likeupdate();
	});
	
	function likeupdate(ExitstCheck){
		var root = getContextPath(),
		likeurl = "/like/likeupdate",
		mid = $('#mid').val(),
		bid = $('#bid').val(),
		count = $('#likecheck').val(),
		data = {"ltmid" : mid,
				"ltbid" : bid,
				"count" : count};
		
	$.ajax({
		url : root + likeurl,
		type : 'PUT',
		contentType: 'application/json',
		data : JSON.stringify(data),
		success : function(result){
			console.log("수정" + result.result);
			if(count == 1){
				console.log("좋아요 취소");
				 $('#likecheck').val(0);
				 $('#likebtn').attr('class','btn btn-light');
			}else if(count == 0){
				console.log("좋아요!");
				$('#likecheck').val(1);
				$('#likebtn').attr('class','btn btn-danger');
			}
		}, error : function(result){
			console.log("에러" + result.result)
		}
		
		});
	};
	
	function getContextPath() {
	    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	} 
	

var guideLa = $('#guideLa').val(),
	guideMa = $('#guideMa').val();
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(guideLa, guideMa), // 지도의 중심좌표
		level: 3 // 지도의 확대 레벨
	};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition = new kakao.maps.LatLng(guideLa, guideMa);

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
	position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);



