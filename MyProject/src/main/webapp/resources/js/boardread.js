/**
 * 
 */
$('#listgo').click(function() {
	var url = getContextPath(),
		page = $('#page').val(),
		perPageNum = $('#perPageNum').val();

	location.href = url + "/boards?" +
		"page=" + page +
		"&perPageNum=" + perPageNum;
});

$('#likebtn').click(function(){
	
	likeupdate();
	});
	
	function likeupdate(){
		var root = getContextPath(),
		likeurl = "/like/likeupdate",
		bid = $('#bid').val(),
		receiver = $('#bwriter').val(),
		btitle = $('#btitle').val(),
		count = $('#likecheck').val(),
		data = {"ltbid" : bid,
				"count" : count};
		
	$.ajax({
		url : root + likeurl,
		type : 'PUT',
		contentType: 'application/json',
		data : JSON.stringify(data),
		success : function(result){
			if(count == 1){
				console.log("좋아요 취소");
				 $('#likecheck').val(0);
				 $('#likebtn').attr('class','btn btn-light');
				 $('#likecount').html(result.like);
				if(sock){
				 var Msg = bid+","+receiver+","+count+","+btitle;
				 sock.send(Msg);
				 }
			}else if(count == 0){
				console.log("좋아요!");
				$('#likecheck').val(1);
				$('#likebtn').attr('class','btn btn-danger');
				$('#likecount').html(result.like);
				if(sock){
				 var Msg = bid+","+receiver+","+count+","+btitle;
				 sock.send(Msg);
				 }
			}
		}, error : function(result){
			console.log("에러" + result.result)
		}
		
		});
	};
	
	function alarm(){
		var root = getContextPath(),
		alarmurl = "/savealarm",
		bid = $('#bid').val(),
		receiver = $('#bwriter').val(),
		data = {"abid" : bid,
				"areceiver" : receiver,
				"acontent" : 'like'};
		
		$.ajax({
			url : root + alarmurl,
			type : 'POST',
			contentType: 'application/json',
			data : JSON.stringify(data),
			success : function(result){
				if(sock){
				 var Msg = bid+","+receiver+","+count+","+btitle;
				 sock.send(Msg);
				 }
				
			}, error : function(result){
				console.log("에러" + result.result)
			}
		
			});
		
	}
	
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



