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
</head>
<body>
	<div class="container">
		<h2>글 작성</h2>
			<input type="hidden" id="guideMa" name="guideMa" value="">
			<input type="hidden" id="guideLa" name="guideLa" value="">
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
						<button class="btn btn-outline-success" type="submit" onclick="return check();">작성</button>
						<button class="btn btn-outline-success" type="button" class="listgo">작성글 지우기</button>
					</td>
				</tr>
			</table>
		
		<div id="clickLatlng" class="text-center"></div>
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
		
	</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc91527cb88d7d84ce36ba29e47d1562&libraries=services"></script>
<script src='<c:url value="/resources/js/writekakao.js"/>'></script>
<script src='<c:url value="/resources/js/boardwrite.js"/>'></script>
</body>
</html>