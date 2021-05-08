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
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="<c:url value="/resources/js/index.js"/>"></script>
</head>
<body>
<form id="logout-form" action='<c:url value='/logout'/>' method="POST">
   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
</form>
<div class="container">
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" href="#">${user}님</a>
        </li>
        <li class="nav-item">
        	<a href="#" style="text-decoration:none;">
       	 	<span id="alal">
       	 	<img src="https://o.remove.bg/downloads/b04867d3-cb5f-495f-999d-e6413899e911/1497620003-jd23_85167-removebg-preview.png" style="width : 50px; height : 50px"/>
       	 	<span id="alarmcount" style="color : red; top : -10px; position : relative; font-size : 12px; margin : 0px 0px 0px -25px; font-weight : 600;"></span>
       	 	</span>
       	 	</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" id="listgo">게시판으로</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" onclick="document.getElementById('logout-form').submit();">로그 아웃</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
</div>
	<div class="container">
		<h2>글 작성</h2>
			<input type="hidden" id="guideMa" name="guideMa" value="">
			<input type="hidden" id="guideLa" name="guideLa" value="">
			<input type="hidden" id="page" name="page" value="${cri.page }">
			<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum }">
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
						<button class="btn btn-outline-success" type="button" id="listgo">게시판으로</button>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb65a905dabe112b30347eb2578e176a&libraries=services"></script>
<script src='<c:url value="/resources/js/writekakao.js"/>'></script>
<script src='<c:url value="/resources/js/boardwrite.js"/>'></script>
</body>
</html>