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
function boarddelete(){
	var bid = $('#bid').val();
	
	$.ajax({
		url : getContextPath()+"/boards/"+ bid,
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