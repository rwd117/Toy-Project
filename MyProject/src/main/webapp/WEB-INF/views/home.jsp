<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<title>Home</title>
</head>
<body>

<div class="container"  style="display: inline-block;text-align: center;" >
		<section class="col-md-auto" style="display: inline-block;text-align: center;">
<h1>
	WelCome!!
</h1>

<sec:authorize access="isAnonymous()">
<a href='<c:url value="/member/join"/>'>Join</a>
<a href='<c:url value="/member/login"/>'>login</a>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal" var="user"/>
<a href="#" onclick="document.getElementById('logout-form').submit();">Sign out</a>
<form id="logout-form" action='<c:url value='/logout'/>' method="POST">
   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
</form>
<p>${user}님, 반갑습니다.</p>
</sec:authorize>


<a href='<c:url value="/boards"/>'>게시물 보기</a>
</section>
</div>
</body>
</html>
