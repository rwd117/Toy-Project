/**
 * 
 */
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

function check(){
		var userIdExist=$('#userIdExist').val();
		if(userIdExist=='false' ){
			alert("사용가능한 아이디를 입력해주세요");
			return false;
		}else if(userIdExist==''){
			alert("중복버튼을 클릭해주세요");
			return false;
		}
	      var mpw= $('#mpwd').val(),
			mpw2=$("#mpwd2").val(),
	      	mname= $('#mname').val(),
	      	memail= $('#memail').val(),
	      	mpost= $('#mpost').val(),
	      	maddress= $('#maddress').val(),
	      	maddress2= $('#maddress2').val(),
	      	pwdrule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,12}$/;
	      
	      if(mpw.length <6){
				alert("비밀번호는 6자 이상이어야 합니다.");
				return false;
				
			}
			if(mpw.length >12){
				alert("비밀번호는 12글자까지 입력 할 수 있습니다.");
				return false;
				
			}
			
			if(!rule.test(mpw)){
 				alert("비밀번호는 대소문자,숫자,특수문자가 들어갸야합니다.");
 				return false;
 			}
			
	      if(mpw == null  || mpw.trim() == ""
			|| mpw2 == null  || mpw2.trim() == ""
			||memail == null  || memail.trim() == ""
	    	  || mname == null  || mname.trim() == ""
	    		  || mpost == null  || mpost.trim() == ""
	    			  || maddress == null  || maddress.trim() == ""|| maddress2 == null  || maddress2.trim() == ""){
	    	 
	    	 if(mpw == null  || mpw.trim() == ""){
	    		 alert("비밀번호가 공백입니다.");
	    	     return false;		 
	    	 }
	    	 if(mname == null  || mname.trim() == ""){
	    		 alert("이름이 공백입니다.");
	    	     return false;		 
	    	 }
	    	 if(mpost == null  || mpost.trim() == ""){
	    		 alert("우편번호가 공백입니다.");
	    	     return false;		 
	    	 }
	    	 if(maddress == null  || maddress.trim() == ""){
	    		 alert("주소가 공백입니다.");
	    	     return false;		 
	    	 }
	    	 if(maddress2 == null  || maddress2.trim() == ""){
	    		 alert("상세주소가 공백입니다.");
	    	     return false;		 
	    	 }if(memail == null || memail.trim() ==""){
					alert("상세주소가 공백입니다.");
	    	     return false;
			}if(mpw!=mpw2){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
	      }
	      
}

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}

$("#mid").keyup(function(){
	var mid = $('#mid').val(),
		idrule = /^[a-z0-9]{4,12}$/,
		chk_num = mid.search(/[0-9]/g);
    	chk_eng = mid.search(/[a-z]/ig);
    	
	if(mid.length<4 || mid.length > 12){
		$('#mIdChkMsg').html("아이디는 4~12글자 입니다.");
 	}else{
 		$('#mIdChkMsg').html("");
 	}
 	
 	if(!idrule.test(mid)||chk_num < 0 || chk_eng <0){
 		$('#mIdChkMsg').html("아이디는 영소문자/숫자로만 이루어져야 합니다.");
 	}
});

$("#mpwd2").keyup(function(){
 	var mPw = $("#mpwd").val(); // 사용자가 mPw에 입력한 값
 	var mPwChk = $("#mpwd2").val(); // 사용자가 mPwChk에 입력한 값
 	if(mPw!=mPwChk){
 		$('#mpwChkMsg').html("비밀번호가 일치하지 않습니다.");
 	}else{
 		$('#mpwChkMsg').html("");
 	}
 }); // mPwChk

$("#mpwd").keyup(function(){
 	var mPw = $("#mpwd").val(); // 사용자가 mPw에 입력한 값
 	var rule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,12}$/;
	if(mPw.length < 6 || mPw.length > 12){
		$('#mpwPatternChkMsg').html("비밀번호는 6~12자 입니다.");
 	}else{
 		$('#mpwPatternChkMsg').html("");
 	}
 	if(!rule.test(mPw)){
 		$('#mpwPatternChkMsg').html("비밀번호는 대소문자,숫자,특수문자가 들어갸야합니다.");
 	}
 }); // mPwChk
  
 

 $("#mname").keyup(function(){ // 이름 유효성은 공백 유무만 검사
 	var mname = $("#mname").val(); // 사용자가 mName에 입력한 값
 	if(mname == " "){
 		$('#mnameChkMsg').html("이름에 공백은 포함할 수 없습니다.");
 	}else{
 		$('#mnameChkMsg').html("");
 	}
 }); //mName

 $('#memail').keyup(function(){
 	var memail = $("#memail").val();
 	var memailPattern = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
 	if(memail != " " && !memailPattern.test(memail)){
 		$('#memailChkMsg').html("이메일 형식(aaa@도메인)에 맞게 입력해주세요.");
 	}else{
 		$('#memailChkMsg').html("");
 	}
 }); // mEmail

 $('#mphone').keyup(function(){
 	var mphone = $("#mphone").val();
 	var mphonePattern = RegExp(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/);
 	if(mphone != " " && !mphonePattern.test(mPhone)){
 		$('#mphoneChkMsg').html("전화번호 형식(010-1234-5678)에 맞게 입력해주세요.");
 	}else{
 		$('#mphoneChkMsg').html("");
 	}
 }); // mPhone

 $('#maddress').keyup(function(){
 	var maddress = $("#maddress").val(),
		maddress2 = $('#maddress2').val(),
		mpost = $('#mpost').val();
		
 	if(maddress == "" || maddress2 == "" || mpost == ""){
 		$('#maddressChkMsg').html("우편번호와 주소를 입력해주세요.");
 	}
 }); // mAddress

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
