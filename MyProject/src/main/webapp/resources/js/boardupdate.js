/**
 * 
 */
	function boardupdate(){
		var bid = $('#bid').val(),
			btitle = $('#btitle').val(),
			bcontent = $('#bcontent').val(),
			data = {
				'bid' : bid,
				'btitle' : btitle,
				'bcontent' : bcontent
			};
		$.ajax({
			url : getContextPath()+"/" + bid,
			type : 'PUT',
			contentType : 'application/json',
			data : JSON.stringify(data),
			success : function(){
				location.href = getContextPath() +"/"+bid;
			}, error : function(){
				console.log("err " + bid);
			}
		});
	}
	
	function getContextPath() {
	    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	} 