/**
 * 
 */

	var socket = null;
 
   $(document).ready(function (){
	   connectWs();
   });
 
   function connectWs(){
   	sock = new SockJS("<c:url value='/alarm'/>") ;
	
   	sock.onopen = function() {
     console.log('open');
     sock.send('test');
 };

 sock.onmessage = function(e) {
     console.log('message', e.data);
     sock.close();
 };

 sock.onclose = function() {
     console.log('close');
 };
 
  }