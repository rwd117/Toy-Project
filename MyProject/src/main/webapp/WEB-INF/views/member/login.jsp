<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<title>Insert title here</title>
</head>
<body>
	<form class="px-4 py-3" action="/login" method="POST">
        <table>
            <tbody>
                <tr>
                    <td>User:</td>
                    <td><input class="form-control" type="text" name="loginid" placeholder="ID"></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input class="form-control" type="password" name="loginpwd" placeholder="Password"></td>
                </tr>
                <tr>
                  <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />
                  <td><button type="submit" class="btn btn-primary">Sign in</button></td>
                </tr>
                
            </tbody>
        </table>
    </form>

</body>
</html>