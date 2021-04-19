<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
		<div class="container">
		<section class="container">
			<form action='<c:url value="/member/joinok"/>' method="post" onsubmit="return check();">
			<input type="hidden" id="userIdExist" name="userIdExist" value="">
				<table>
					<tr>
						<th>
							<a href='<c:url value="/"/>'><h1>Home</h1></a>
						</th>
					</tr>
					<tr>
						<td>
							아이디 <input class="form-control" type="text" id="mid" name="mid" required="required" placeholder="영문소문자/숫자 4~12자"  >
							<button class="btn btn-primary" onclick="return checkUserIdExist()">중복확인</button>
						</td>
					</tr>
					<tr>
						<td	class="msg" id="mIdChkMsg">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							비밀번호<input class="form-control" type="password" id="mpwd" name="mpwd" required="required" placeholder="영문대소문자+숫자+특수문자 6~12자">
						</td>
					</tr>
					<tr>
						<td class="msg" id="mpwPatternChkMsg">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							비밀번호 확인<input class="form-control" type="password" id="mpwd2" name="mpwd2" required="required">
						</td>
					</tr>
					<tr>
						<td	class="msg" id="mpwChkMsg">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							이름 <input type="text" class="form-control" id="mname" name="mname" required="required">
						</td>
					</tr>
					<tr>
						<td	class="msg" id="mnameChkMsg">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							이메일<input type="email" class="form-control" id="memail" name="memail" required="required" placeholder="예) abcd@efgh.com">
						</td>
					</tr>
					<tr>
						<td class="msg" id="memailChkMsg">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td class="noborder">
							주소 <a id="addressBtn">우편번호 찾기</a>
						</td>
					</tr>
					<tr>
						<td class="noborder">
							<input type="text" class="mpost" id="mpost" name="mpost" placeholder="우편번호" readonly>							
						</td>
					</tr>
					<tr>
						<td class="noborder">
							<input type="text" class="address" id="maddress" name="maddress" placeholder="주소" readonly>		
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" class="address" id="maddress2" name="maddress2" placeholder="상세주소">							
						</td>
					</tr>
					<tr>
						<td	class="msg" id="maddressChkMsg">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</table>
				<br>
				<br>
				<input type="submit" class="btn" value="회원가입"/>
			</form>
			</section>
		</div>

 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script src="<c:url value="/resources/js/memberjoin.js"/>" ></script>
 
</body>
</html>