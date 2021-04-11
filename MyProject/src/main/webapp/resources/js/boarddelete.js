/**
 * 
 */
function boarddelete(){
	var bid = $('#bid').val();
	
	$.ajax({
		url : getContextPath()+"/"+ bid,
		type : 'DELETE',
		contentType : 'application/json',
		success : function(){
			location.href = getContextPath();
		}, error : function(){
			console.log("err " + bid);
		}
	});
}

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
} 