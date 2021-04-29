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
  
![image](https://user-images.githubusercontent.com/69449157/115958769-bdc30a80-a543-11eb-9f7f-e07285b5c52b.png)


</details>



<details>
    <summary>게시물 작성</summary>
  
![image](https://user-images.githubusercontent.com/69449157/115558851-1c8f4680-a2ee-11eb-8193-36fc89773d10.png)

</details>

<details>
    <summary>게시물 상세보기</summary>
  
![image](https://user-images.githubusercontent.com/69449157/116549768-dca11280-a930-11eb-838d-00226e63886f.png)


![image](https://user-images.githubusercontent.com/69449157/116549806-ea569800-a930-11eb-8860-afc9ad52d737.png)

</details>


<details>
    <summary>게시물 수정</summary>
  
![image](https://user-images.githubusercontent.com/69449157/115958969-bb14e500-a544-11eb-948e-6ab50f8211f9.png)



</details>

<details>
    <summary>게시물 삭제</summary>
  
![image](https://user-images.githubusercontent.com/69449157/115958992-d97ae080-a544-11eb-9aad-9915d2a5cc28.png)

</details>









