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
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
		<c:if test="${user == board.bwriter}">
			<a href="<c:url value="/board/update?bid=${board.bid }"/>">[게시물 수정]</a> 
			<a href="<c:url value="/board/delete?bid=${board.bid }"/>">[게시물 삭제]</a>		
		</c:if>
		<a class="alistBtn" href="<c:url value="/board/list"/>">[게시판으로]</a>
		<hr />
		<!-- 게시물 기본 정보  -->
		<h3>${board.bid}번게시물</h3>
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


		<hr />
		<div class="col-md-6"><!-- 댓글 작성 div -->
			<label for="reply_writer">작성자 :</label>
			 <input type="text"	class="form-control" id="reply_writer" name="reply_writer"><br />
			<label for="reply_content">댓글 내용 :</label>
			<textarea class="form-control" id="reply_content" name="reply_content"></textarea>
			<button type="button" class="btn btn-outline-success" id="replywriteBtn">댓글 작성</button>
		</div>
		<br/>
		<hr/>


		<div class="container"><!-- 댓글이 들어갈 div -->
			<div id="replylist"></div>
		</div>

	</div>
</body>
</html>