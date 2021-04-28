/**
 * 
 */
	var sock = null;
 
   $(document).ready(function(){
		connectWs();
   });
  
	function connectWs(){
	
	sock = new SockJS(getContextPath()+'/alarm');
	
   	sock.onopen = function() {
     	console.log('open');
	 };

 	sock.onmessage = function(e) {
   	  console.log('message', e.data);
 //  	  sock.close();
	 };

 	sock.onclose = function() {
 	    console.log('close');
	 };
 
  };

	function getContextPath() {
	    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	}; 