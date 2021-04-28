<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
		
		<input type="hidden" id="page" name="page" value="${cri.page }">
		<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum }">
		<input type="hidden" id="guideLa" name="guideLa" value="${board.guideLa }">
		<input type="hidden" id="guideMa" name="guideMa" value="${board.guideMa }">
		<hr/>
		<!-- 게시물 기본 정보  -->
		<h3>${board.bid}번게시물</h3>
		<input type="hidden" name="bid" id="bid" value="${board.bid}"/>
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" id="btitle" name="btitle" value="${board.btitle }"/></td>
				<td>좋아요 : ${board.blike } </td>

			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" id="bcontent" name="bcontent" >${board.bcontent }</textarea></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input class="form-control" type="text" id="bwriter" name="bwriter" value="${board.bwriter }" disabled="disabled" /></td>
				<td>작성 날짜 : ${board.bdate }</td>
			</tr>
					
			<tr>
				<td>
					<button class="btn btn-outline-success" type="button" onclick="return boardupdate();">게시물 수정</button>
					<button class="btn btn-outline-success" type="button" id="listgo">게시판으로</button>
				</td>
			</tr>
		</table>
		<div id="map" style="width:600px;height:350px;"></div>    
		<hr />
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb65a905dabe112b30347eb2578e176a&libraries=services"></script>
<script src="<c:url value="/resources/js/boardupdate.js"/>"></script>
</body>
</html>