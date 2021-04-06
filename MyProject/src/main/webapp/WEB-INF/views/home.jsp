<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
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


<a href='<c:url value="/board/list"/>'>게시물 보기</a>

</body>
</html>
