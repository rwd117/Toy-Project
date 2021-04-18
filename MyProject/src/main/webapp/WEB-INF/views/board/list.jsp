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
		<section id="container">
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
 					<tbody id="tbody">
 						<c:forEach var="board" items="${list }">
 							<tr>
 							<td>${board.bid }</td>
 							<td><a href='<c:url value="/boards/${board.bid}?page=${cri.page}&perPageNum=${cri.perPageNum}" />'>${board.btitle}</a></td>
 							<td>${board.bwriter}</td>
 							<td>0</td>
 							<td>${board.bdate}</td>
 							</tr>
 						</c:forEach>
 					</tbody>
					
				</table>
				<hr/>
		</section>
		
		<section>
			<a href='<c:url value="/boards/newBoard"/>'>게시물 작성</a>
		</section>
		
		<div class="col-md-4 container">
			<ul class="pagination">
  			 <c:if test="${pagemaker.prev }">
    			<li>
        			<a class="btn btn-outline-primary" href='<c:url value="/boards?page=${pagemaker.startPage-1 }"/>'>[이전]</a>
    			</li>
   			</c:if>
  			 <c:forEach begin="${pagemaker.startPage }" end="${pagemaker.endPage }" var="pageNum">
		    	<li>
		        	<a class="btn btn-outline-primary" href='<c:url value="/boards?page=${pageNum}"/>'>${pageNum }</a>
		    	</li>
			   </c:forEach>
			   <c:if test="${pagemaker.next && pagemaker.endPage >0 }">
			    	<li>
			        	<a class="btn btn-outline-primary" href='<c:url value="/boards?page=${pagemaker.endPage+1 }"/>'>[다음]</a>
			    	</li>
			   </c:if>
			</ul>
		</div>
		
	</div>
</body>
</html>