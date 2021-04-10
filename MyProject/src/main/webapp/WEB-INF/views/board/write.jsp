<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<sec:authentication property="principal" var="user"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/resources/css/kakao.css"/>">
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc91527cb88d7d84ce36ba29e47d1562&libraries=services"></script>
</head>
<body>
	<div class="container">
		<h2>글 작성</h2>
		<form action="writeok" method="post">
		<input type="hidden" id="guideLa" name="guideLa" value="">
		<input type="hidden" id="guideMa" name="guideMa" value="">
			<table class="table">
				<tr>
					<td>제목</td>
					<td class="table-active"><input class="form-control"
						type="text" id="btitle" name="btitle" /></td>
				</tr>
				<tr>
					<td scope="row">내용</td>
					<td class="table-active"><textarea class="form-control"
							id="bcontent" name="bcontent"></textarea></td>
				</tr>
				<tr>
					<td scope="row">작성자</td>
					<td class="table-active">
					<input class="form-control" type="text" id="writer" name="writer" readonly="readonly"  value="${user}"/></td>
				</tr>
				<tr>
					<td>
						<button class="btn btn-outline-success" type="submit">작성</button>
						<button class="btn btn-outline-success" type="button" class="listgo">작성글 지우기</button>
					</td>
				</tr>
			</table>
		</form>
		
		<div class="map_wrap">
    		<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
			    <div id="menu_wrap" class="bg_white">
        			<div class="option">
            			<div>
               			 <form onsubmit="searchPlaces(); return false;">
                    		키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    	<button class="btn btn-outline-success" type="submit">검색하기</button> 
                		</form>
            			</div>
        			</div>
        				<hr>
        				<ul id="placesList"></ul>
        				<div id="pagination"></div>
    			</div>
		</div>
		<div id="clickLatlng"></div>
	</div>
		
<script type="text/javascript">
//마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    },
    selectedMarker = null;

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    var ClickimageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/2009/map/icon/ico_mn_13.png', // 클릭했을 때의 image 설정
    	ClickimageSize = new kakao.maps.Size(36, 37),
    	ClickimgOptions = new kakao.maps.Point(13, 37),
    	ClickImage = new kakao.maps.MarkerImage(ClickimageSrc,ClickimageSize,ClickimgOptions);
    
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
            
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
            	displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
            
            kakao.maps.event.addListener(marker, 'click', (function(placePosition,i) {
            	displayInfowindow(marker, title);
            	return function() {
                    // #clickLatlng 영역에 좌표정보 출력
                    var message = '선택하신 위치는 ' +'"'+title+'"';
                    console.log(placePosition.La);
                    console.log(placePosition.Ma);
                    $('#guideMa').val(placePosition.La);
                    $('#guideLa').val(placePosition.Ma);
                    var resultDiv = document.getElementById('clickLatlng');
                    resultDiv.innerHTML = message;
                   
                   if (!selectedMarker || selectedMarker !== marker) {

                       // 클릭된 마커 객체가 null이 아니면
                       // 클릭된 마커의 이미지를 기본 이미지로 변경하고
                       !!selectedMarker && selectedMarker.setImage(null);

                       // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
                       marker.setImage(ClickImage);
                   }

                   // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
                   selectedMarker = marker;
                }

            })(placePosition,i));
            
            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
            
            itemEl.onclick =  function (placePosition) {
            	
            	return function(){
            		 var message = '선택하신 위치는 ' +'"'+title+'"';
                     $('#guideMa').val(placePosition.La);
                     $('#guideLa').val(placePosition.Ma);
                     var resultDiv = document.getElementById('clickLatlng');
                     resultDiv.innerHTML = message;
                    
                    if (!selectedMarker || selectedMarker !== marker) {

                        // 클릭된 마커 객체가 null이 아니면
                        // 클릭된 마커의 이미지를 기본 이미지로 변경하고
                        !!selectedMarker && selectedMarker.setImage(null);

                        // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
                        marker.setImage(ClickImage);
                    }
                    // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
                    selectedMarker = marker;
            	}
            }(placePosition);
            
        })(marker, places[i].place_name);
        
        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
        var marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}	

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
</body>
</html>