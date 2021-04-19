<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="user"/>
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
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="user" />
			<form id="logout-form" action='<c:url value='/logout'/>' method="POST">
				<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
			</form>
			<p>${user}님,반갑습니다.</p>
			<a href="#" onclick="document.getElementById('logout-form').submit();">Sign out</a>
			<c:if test="${user == board.bwriter}">
			<a href="<c:url value="/boards/newBoard/${board.bid}?type=edit"/>">[게시물 수정]</a> 
			<a href="<c:url value="/boards/newBoard/${board.bid}?type=check"/>">[게시물 삭제]</a>		
			</c:if>
		</sec:authorize>

		<input type="hidden" id="page" name="page" value="${cri.page }">
		<input type="hidden" id="perPageNum" name="perPageNum" value="${cri.perPageNum }">
		<input type="hidden" id="guideLa" name="guideLa" value="${board.guideLa }">
		<input type="hidden" id="guideMa" name="guideMa" value="${board.guideMa }">
		<hr />
		<!-- 게시물 기본 정보  -->
		<button class="btn btn-outline-success" type="button" id="listgo">게시판으로</button>
		<h3>${bid}번게시물</h3>
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" id="btitle" name="btitle" value="${board.btitle }" disabled="disabled" /></td>
				<td>조회수 : </td>

			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" id="bcontent" name="bcontent" disabled="disabled">${board.bcontent }</textarea></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input class="form-control" type="text" id="bwriter" name="bwriter" value="${board.bwriter }" disabled="disabled" /></td>
				<td>작성 날짜 : ${board.bdate }</td>
			</tr>
			
			
		</table>
			<div id="staticMap" style="width:600px;height:350px;"></div>    
		<hr />
		
		<br/>
		<hr/>

	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc91527cb88d7d84ce36ba29e47d1562&libraries=services"></script>
	<script src="<c:url value="/resources/js/boardread.js" />"></script>
</body>
</html>