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
		<div id="container">
		<section id="container">
			<form action='<c:url value="/member/joinok"/>' method="post">
				<table>
					<tr>
						<th>
							<a href='<c:url value="/"/>'><h1>Home</h1></a>
						</th>
					</tr>
					<tr>
						<th>
							필수정보
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
							비밀번호<input class="form-control" type="password" id="mpwd" name="mpwd" required="required" placeholder="영문대소문자+숫자+특수문자 9~12자">
						</td>
					</tr>
					<tr>
						<td class="msg" id="mpwPatternChkMsg">
							&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							비밀번호 확인<input class="form-control" type="password" id="mpw2" name="mpw2" required="required">
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
							<input type="text" class="mpost" id="mpost" name="mpost" placeholder="우편번호">							
						</td>
					</tr>
					<tr>
						<td class="noborder">
							<input type="text" class="address" id="maddress" name="maddress" placeholder="주소">		
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
 <script>
 $("#addressBtn").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	
			var addr = ''; // 주소 변수
			var extraAddr =''; // 참고항목 변수
			
			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
         if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
             addr = data.roadAddress;
         } else { // 사용자가 지번 주소를 선택했을 경우(J)
             addr = data.jibunAddress;
         }			
         // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
         if(data.userSelectedType === 'R'){
             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                 extraAddr += data.bname;
             }
             // 건물명이 있고, 공동주택일 경우 추가한다.
             if(data.buildingName !== '' && data.apartment === 'Y'){
                 extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
             }
             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
             if(extraAddr !== ''){
                 extraAddr = ' (' + extraAddr + ')';
             }
             // 조합된 참고항목을 해당 필드에 넣는다.
             $("#maddress2").val(extraAddr);           
	            
         } else {
	                $("#maddress2").val(' ');
	            }
         // 우편번호와 주소 정보를 해당 필드에 넣는다.
         $("#mpost").val(data.zonecode);
         $("#maddress").val(addr);
         $("#maddress2").focus();
     	}
	    }).open();
	});	
 </script>
</body>
</html>