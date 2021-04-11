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
 						
 					</tbody>
					
				</table>
				<hr/>
		</section>
		
	</div>
	<script>
	$(function(){
		boardlist();
	});
	function boardlist(){
		
		$.ajax({
			url : getContextPath()+"/board",
			type : "GET",
			contentType : 'application/json',
			success : function(data){
				var list = "";
				if(data.length){
					list += "게시물이 없습니다.";
				}else{
					$(data).each(function(){
						list += setList(data);
					});
				};
				$('#tbody').html(list);
			}, error : function(data){
				
			}
		});
	}
	
	function setList(a){
		var list = "<tr>";
		list += "<td>"+a.bid+"</td>";
		list += "<td>"+a.btitle+"</td>";
		list += "<td>"+a.bwriter+"</td>";
		list += "<td>"+0+"</td>";
		list += "<td>"+a.bdate+"</td>";
		list += "</tr>";
		return list;
	}
	
	function getContextPath() {
	    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	} 
	
	
	</script>
</body>
</html>