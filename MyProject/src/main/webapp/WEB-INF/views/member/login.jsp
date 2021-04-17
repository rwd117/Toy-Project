<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<div class="container" style="width : 1600px">
	<section id="container" >
	<form class="px-4 py-3" action="<c:url value="/member/loginok"/>" method="POST">
        <table>
            <tbody>
                <tr>
                    <td>ID:</td>
                    <td><input class="form-control" type="text" name="loginid" placeholder="ID"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input class="form-control" type="password" name="loginpwd" placeholder="Password"></td>
                </tr>
                <tr>
                  <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"s>
                  <td><button type="submit" class="btn btn-primary">Sign in</button></td>
                </tr>
                
            </tbody>
        </table>
    </form>
    </section>
</div>
</body>
</html>