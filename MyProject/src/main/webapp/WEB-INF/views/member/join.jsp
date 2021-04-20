<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container"  style="display: inline-block;text-align: center;" >
		<section class="col-md-auto" style="display: inline-block;text-align: center;">
			<form action='<c:url value="/member/joinok"/>' method="post" onsubmit="return check();">
			<input type="hidden" id="userIdExist" name="userIdExist" value="">
			 <div class="input-group input-group-lg">
				<table>
					<tr>
						<th>
							<a href='<c:url value="/"/>'><h1>Home</h1></a>
						</th>
					</tr>
					<tr>
						<td>
							아이디 <input class="form-control" type="text" id="mid" name="mid" required="required" placeholder="영문소문자/숫자 4~12자" style="width : 400px"  >
							<button class="btn btn-primary" onclick="return checkUserIdExist()">중복확인</button>
						</td>
					</tr>
					<tr>
						<td	class="msg" id="mIdChkMsg" style="color:red">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							비밀번호<input class="form-control" type="password" id="mpwd" name="mpwd" required="required" placeholder="영문대소문자+숫자+특수문자 6~12자">
						</td>
					</tr>
					<tr>
						<td class="msg" id="mpwPatternChkMsg" style="color:red">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							비밀번호 확인<input class="form-control" type="password" id="mpwd2" name="mpwd2" required="required">
						</td>
					</tr>
					<tr>
						<td	class="msg" id="mpwChkMsg" style="color:red">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							이름 <input type="text" class="form-control" id="mname" name="mname" required="required">
						</td>
					</tr>
					<tr>
						<td	class="msg" id="mnameChkMsg" style="color:red">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							이메일<input type="email" class="form-control" id="memail" name="memail" required="required" placeholder="예) abcd@efgh.com">
						</td>
					</tr>
					<tr>
						<td class="msg" id="memailChkMsg" style="color:red">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td class="noborder">
							주소 <a id="addressBtn" class="btn btn-link" style="cursor:pointer">우편번호 찾기</a>
						</td>
					</tr>
					<tr>
						<td class="noborder">
							<input type="text" class="form-control mpost" id="mpost" name="mpost" placeholder="우편번호" readonly>							
						</td>
					</tr>
					<tr>
						<td class="noborder">
							<input type="text" class="form-control address" id="maddress" name="maddress" placeholder="주소" readonly>		
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" class="form-control address" id="maddress2" name="maddress2" placeholder="상세주소">							
						</td>
					</tr>
					<tr>
						<td	class="msg" id="maddressChkMsg" style="color:red">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</table>
				</div>
				<br>
				<br>
				<input type="submit" class="btn btn-outline-secondary" value="회원가입"/>
			</form>
			</section>
		</div>

 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script src="<c:url value="/resources/js/memberjoin.js"/>" ></script>
 
</body>
</html>