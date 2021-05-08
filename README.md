# Toy-Project


------------

## 기술스택

+ Backend: Spring(MVC,Security) | Java 8 | Oracle | Mybatis | Tomcat 9.0 | 

+ Frontend: JavaScript(jQuery), Bootstrap

------------

## 구현기능

+ 로그인,회원가입 (Spring Security)

+ 게시물 작성(카카오 맵 api를 이용)

+ 작성자 이외의 사람이 url로 접근시 인터셉터 적용(관리자 포함, 관리자는 해당 게시물 상세보기를 누르면 수정 및 삭제 가능)

+ 좋아요 기능 구현(Ajax)

+ 좋아요 클릭 시, 소켓을 이용하여 실시간 알림


------------

## 기능 설명


<details>
    <summary>회원가입</summary>
  
![image](https://user-images.githubusercontent.com/69449157/115558572-d89c4180-a2ed-11eb-9df5-600a0d45f772.png)

+ 자바스크립트를 이용해서 유효성 검사(ex : id에 관한 유효성 검사 및 중복검사)
~~~
function checkUserIdExist(){
	var idurl = "/member/idcheck/",
		mid = $('#mid').val(),
		idrule = /^[a-z0-9]{4,12}$/,
		chk_num = mid.search(/[0-9]/g),
    	chk_eng = mid.search(/[a-z]/ig);
	
	if(mid.length <4){
			alert("아이디는 4자 이상이어야 합니다.");
			return false;
			
	}
	if(mid.length >12){
		alert("아이디는 12자까지 입력 할 수 있습니다.");
		return false;
			
	}
	if(!idrule.test(mid) || chk_num < 0 || chk_eng < 0){
		alert("아이디는 영어/숫자로만 입력 할 수 있습니다.");
		return false;
			
	}
	if(mid.length == 0 ||mid == null || mid.trim() == "" ) {
		alert("아이디를 입력해주세요");
		return false;
			
	}
		$.ajax({
		url : getContextPath()+idurl+mid,
		type : 'POST',
		dataType : 'json',
		success : function(data){
				if(data.result==='success') {
					alert('사용할수 있는 아이디');
					$('#userIdExist').val('true');
				
				}
				else {
					alert('사용할수 없는 아이디');
					$('#userIdExist').val('false');
					
				}
		}, error : function(data){
			alert('사용할수 없는 아이디');
			$('#userIdExist').val('false');
					
		}	
	});	
	
	return false;
	
};
~~~

+ 주소 찾기는 다음 주소찾기 Api이용

</details>



<details>
    <summary>로그인 후</summary>
  
![image](https://user-images.githubusercontent.com/69449157/115558644-e782f400-a2ed-11eb-9214-975fc8575f7e.png)

+ 로그인 한 상태와 안한 상태 구분(시큐리티 이용)
~~~
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
~~~

+ 게시물 보기의 경우 로그인 상태에서만 확인 가능(시큐리티)


</details>


<details>
    <summary>게시물 리스트</summary>
  
![image](https://user-images.githubusercontent.com/69449157/117146902-a57aa780-adef-11eb-9019-e1618da7ea0d.png)


</details>



<details>
    <summary>게시물 작성</summary>
  
![image](https://user-images.githubusercontent.com/69449157/117147268-0dc98900-adf0-11eb-8df5-51958ea7ef90.png)

+ 게시물 작성(카카오 맵 Api이용)

</details>

<details>
    <summary>게시물 상세보기</summary>
  
![image](https://user-images.githubusercontent.com/69449157/117146948-b4615a00-adef-11eb-9bf8-10a02b71d4f4.png)

![image](https://user-images.githubusercontent.com/69449157/117147061-d78c0980-adef-11eb-8cf4-20c9eb72ae70.png)

+ 작성자 이외 사용자는 좋아요 버튼 생성(Ajax)

+ 좋아요 클릭 시, 소켓으로 작성자의 알람의 숫자가 증가

![image](https://user-images.githubusercontent.com/69449157/117147115-e672bc00-adef-11eb-87af-1f214779869f.png)

+ 작성자 및 관리자의 경우 좋아요 버튼 생성 x(jstl 이용)

</details>


<details>
    <summary>게시물 수정</summary>
  
![image](https://user-images.githubusercontent.com/69449157/117147521-4bc6ad00-adf0-11eb-8e35-f60b01847444.png)

+ 제목, 내용 수정 가능


</details>

<details>
    <summary>게시물 삭제</summary>
  
![image](https://user-images.githubusercontent.com/69449157/117147595-5c772300-adf0-11eb-8c21-8153b13a378b.png)


</details>









