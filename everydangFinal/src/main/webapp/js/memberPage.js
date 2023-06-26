/**
 * 
 */

getMemPage = function() {
	 $.ajax({
		 url:`${myPath}/getMemPage.do`,
		 data:{"mmId":mmId},
		 type:'get',
		 success: function(response) {
			if(response == null){
				alert("z");
			}
		 },
		 error: function(xhr,ss){
			 alert(xhr.status);
			 console.log(ss);
		 },
		 dataType : "Json"
	 })
 }