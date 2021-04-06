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
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<style>

textarea {
	resize: none;
}

li {
	list-style: none;
}
</style>
</head>
<body>
	<div class="container">
		<h2>글 작성</h2>
		<form action="writeok" method="post">
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
	</div>

<body>


</body>
</html>