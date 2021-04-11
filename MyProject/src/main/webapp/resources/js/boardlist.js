/**
 * 
 */
$(function(){
	boardlist();
});
function boardlist(){
	var listurl="/boards";
	
	$.ajax({
		url : getContextPath() + listurl,
		type : 'GET',
		dataType : 'json',
		success : function(data){
			var list = "";
			if(data.length == 0){
				list = "게시물이 없습니다.";
			}else{
				
				$(data).each(function(){
					list += '<tr>';
					list += setTable(this.bid);
					list +=	setHref(this.bid,this.btitle);
					list +=	setTable(this.bwriter);
					list += setTable(0);
					list +=	setTable(this.bdate);
					list += '</tr>';
				});
				
			}
			$('#tbody').html(list);
		},error : function(data){
			console.log(data + 'error');
		}
	})
};

function setTable(a){
	var setTd = "<td>" + a + "</td>";
	return setTd;
};

function setHref(a,b){
	var setTd = "<td>";
	setTd += "<a href='"+getContextPath()+"/boards/"+a+"'>" + b+ "</a>";
	setTd += "</td>";
	return setTd;
};

function getContextPath() {
    var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}