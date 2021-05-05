/**
 * 
 */
	var sock = null;
 
   $(document).ready(function(){
		connectWs();
		alarmcount();
   });
  
	function connectWs(){
	
	sock = new SockJS(getContextPath()+'/alarm');
	
   	sock.onopen = function() {
		
     	console.log('open');
	 };

 	sock.onmessage = function(e) {
   	  console.log('message', e.data);
		alarmcount();
	  $('#alal').html(e.data);	
 //  	  sock.close();
	 };

 	sock.onclose = function() {
 	    console.log('close');
	 };
 
  };

	function alarmcount(){
		var root = getContextPath(),
			count = "/msg/countalarm";
		
		$.ajax({
			url : root + count,
			type : 'POST',
			contentType: 'application/json',
			success : function(result){
				$('#alarmcount').html(result);
			},error : function(result){
				console.log("에러" + result);
			}	
		});
	}

	function getContextPath() {
	    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	}; 