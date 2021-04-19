/**
 * 
 */
 
 	$('#listgo').click(function(){
		var url = "http://localhost:8077/MyProject",
			page = $('#page').val(),
			perPageNum = $('#perPageNum').val();
			
		location.href = url + "/boards?"+
						"page="+page+
						"&perPageNum="+perPageNum;
	});
	function check(){
		var title = $('#btitle').val(),
			content = $('#bcontent').val(),
			guideMa = $('#guideMa').val(),
			guideLa = $('#guideLa').val(),
			data = {
				"btitle" : title,
				"bcontent" : content,
				"guideMa" : guideMa,
				"guideLa" : guideLa
			};	
		
		if(title ==null|| title.trim() ==''){
			alert("제목을 확인 해 주세요");
			return false;
		}
		if(title.length < 4){
			alert("제목의 글자 수는 최소 4글자 이상입니다.");
			return false;
		}
		if(content ==null|| content.trim() ==''){
			alert("내용을 확인 해 주세요");
			return false;
		}
		if(content.length < 10){
			alert("내용의 글자 수는 최소 10글자 이상입니다.");
			return false;
		}
		if(guideMa ==null || guideLa==null || guideMa.trim() == '' || guideLa.trim() == ''){
			alert("음식점을 알려주세요");
			return false;
		}
		
		sendAjax(data);
		
	};
	
	function sendAjax(data){
		var page = $('#page').val(),
			perPageNum = $('#perPageNum').val();
			
			
		$.ajax({
			url : getContextPath()+"/boards",
			type : 'POST',
			contentType: 'application/json',
			data : JSON.stringify(data),
			success : function(bid){
				 location.href = getContextPath() +"/boards/"+bid+
				 		"?page="+page+
						"&perPageNum="+perPageNum;
			}, error : function(bid){
				console.log("err " + bid);
			}
		});
	}
	
	function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	} 
	
	