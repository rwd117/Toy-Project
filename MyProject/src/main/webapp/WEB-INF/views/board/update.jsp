<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
		
		<a class="alistBtn" href="<c:url value="/board/list"/>">[게시판으로]</a>
		<hr />
		<!-- 게시물 기본 정보  -->
		<h3>${board.bid}번게시물</h3>
		<form action="updateok" method="post">
		<input type="hidden" name="bid" id="bid" value="${board.bid}"/>
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" id="btitle" name="btitle" value="${board.btitle }"/></td>
				<td>조회수 : </td>

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
					<button class="btn btn-outline-success"  type="submit">게시물 수정</button>
					<button class="btn btn-outline-success"  type="button" class="listgo">수정 취소</button>
				</td>
			</tr>
		</table>
		</form>
</div>

</body>
</html>