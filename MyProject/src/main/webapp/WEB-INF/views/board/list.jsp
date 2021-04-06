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
		<section id="container">
			<form>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>게시글 번호</th>
							<th>게시글 제목</th>
							<th>게시글 작성자</th>
							<th>게시글 조회수</th>
							<th>작성 날짜</th>
						</tr>
					</thead>

					<c:forEach var="board" items="${list}">

						<tr>
							<td>${board.bid}</td>
							<td><a href="<c:url value="/board/read?bid=${board.bid }" />">${board.btitle}</a></td>
							<td>${board.bwriter}</td>
							<td>0</td>
							<td>${board.bdate}</td>
						</tr>

					</c:forEach>
				</table>
				<hr />
			</form>
		</section>
	</div>
	
</body>
</html>