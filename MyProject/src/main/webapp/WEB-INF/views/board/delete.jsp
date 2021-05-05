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
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="<c:url value="/resources/js/index.js"/>"></script>
</head>
<body>
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
       	 	<img src="https://o.remove.bg/downloads/533ae0fd-6b22-4255-a7d2-6ec8f06cc84e/1497620003-jd23_85167-removebg-preview.png" style="width : 50px; height : 50px"/>
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
		
		<input type="hidden" id="page" name="page" value="${cri.page }">
			<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum }">
			<input type="hidden" id="guideLa" name="guideLa" value="${board.guideLa }">
		<input type="hidden" id="guideMa" name="guideMa" value="${board.guideMa }">
		<hr />
		<!-- 게시물 기본 정보  -->
		<h3>${board.bid}번게시물</h3>
		<input type="hidden" name="bid" id="bid" value="${board.bid}"/>
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" id="btitle" name="btitle" value="${board.btitle }"  disabled="disabled"/></td>
				<td>좋아요 : ${board.blike } </td>

			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" id="bcontent" name="bcontent"  disabled="disabled" >${board.bcontent }</textarea></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input class="form-control" type="text" id="bwriter" name="bwriter" value="${board.bwriter }" disabled="disabled" /></td>
				<td>작성 날짜 : ${board.bdate }</td>
			</tr>
			
					
			<tr>
				<td>
					<button class="btn btn-outline-success"  type="button" onclick="return boarddelete();">게시물 삭제</button>
					<button class="btn btn-outline-success" type="button" id="listgo">게시판으로</button>
				</td>
			</tr>
		</table>
		<div id="map" style="width:600px;height:350px;"></div>    
		<hr />
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb65a905dabe112b30347eb2578e176a&libraries=services"></script>
<script src="<c:url value="/resources/js/boarddelete.js"/>"></script>
</body>
</html>