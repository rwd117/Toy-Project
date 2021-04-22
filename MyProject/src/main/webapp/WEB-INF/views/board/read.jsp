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
		<sec:authentication property="principal" var="user" />
		<sec:authorize access="isAuthenticated()">
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
		<input type="hidden" id="bid" name="bid" value="${board.bid }">
		<input type="hidden" id="mid" name="mid" value="${user }">
		<hr />
		<!-- 게시물 기본 정보  -->
		<button class="btn btn-outline-success" type="button" id="listgo">게시판으로</button>
		<h3>${board.bid}번게시물</h3>
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input class="form-control" type="text" id="btitle" name="btitle" value="${board.btitle }" disabled="disabled" /></td>
				<td id="like"></td>

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
			<div id="map" style="width:600px;height:350px;"></div>    
		<hr />
		
		<br/>
		<hr/>

	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc91527cb88d7d84ce36ba29e47d1562&libraries=services"></script>
	<script src="<c:url value="/resources/js/boardread.js" />"></script>
	<script type="text/javascript">
	$(function(){
		likecheck();
	});
	
	function likecheck(){
		var root = getContextPath(),
			likeurl = "/like/check",
			mid = $('#mid').val(),
			bid = $('#bid').val(),
			data = {"ltmid" : mid,
					"ltbid" : bid},
			button="",
			like=0;
			
		$.ajax({
			url : root + likeurl,
			type : 'POST',
			contentType: 'application/json',
			data : JSON.stringify(data),
			success : function(result){
				if(result.result === 'ok'){
					like = ltlikecheck();
					if(like === 0){
						button +='<button type="button" class="btn btn-light" id="likebtn">좋아요</button>'; // 존재. 좋아요를 눌렀다가 취소한 경우
						button +='<input type="hidden" id="nextCheck" value="'+like+'">';
						
					}else if(like === 1){
						button +='<button type="button" class="btn btn-danger" id="likebtn">좋아요</button>';// 존재. 좋아요를 누른 상태
						button +='<input type="hidden" id="nextCheck" value="'+like+'">';
					}
				}else{
					button +='<button type="button" class="btn btn-light" id="likebtn">좋아요</button>';//존재하지 않을때 insert해야함
					button +='<input type="hidden" id="nextCheck" value="'+(like+2)+'">';
				}
				$('#like').html(button);
				
			}, error : function(result){
				console.log("에러" + result.result)
			}
			
		});
	}
	
	function ltlikecheck(){
		var root = getContextPath(),
		likeurl = "/like/ltlikecheck",
		mid = $('#mid').val(),
		bid = $('#bid').val(),
		data = {"ltmid" : mid,
				"ltbid" : bid},
		check = 0;
		
		$.ajax({
			url : root + likeurl,
			type : 'POST',
			contentType: 'application/json',
			data : JSON.stringify(data),
			success : function(result){
				if(result.result === 'like'){
					check = 1;	
				}else{
					check = 0;
				}
			}, error : function(result){
				console.log("에러" + result.result)
			}
			
		});
	
		return check;
	}
	
	
	function getContextPath() {
	    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	} 
	
	$('#likebtn').click(function(){
		var ExitstCheck	= $('#nextCheck').val();	
		
		if(ExitstCheck === '0'){//테이블에 없는 상태
			
		}else if(ExitstCheck === 'no'){//좋아요를 취소해서 원상 복귀 하지만 테이블에 남아있는 상태
			
		}else if(ExitstCheck === 'like'){//좋아요를 누른 상태
			
		}
		
	});
	</script>
</body>
</html>