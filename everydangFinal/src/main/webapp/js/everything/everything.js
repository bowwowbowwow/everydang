/**
 * 
 */

deleteCart = function() {

	$.ajax({
		url: `${myPath}/deleteCart.do`,
		data: {
			"pr_code" : code,
			"cr_selop" : crSelop
		},
		type: 'post',
		success: function(res){
			alert(res);
			
			$cartBox.remove();
			
			m = $('#totalCart').val() - cto;
			tm = $('.totalCost strong').text() - cto;
			$('#totalCart').val(m);
			$('.totalCost strong').text(tm);
			
		},
		error: function(xhr){
			alert(xhr.status);
		},
		dataType: 'json'
	})
}

deleteWish = function() {
	
	$.ajax({
		url: `${myPath}/deleteWish.do`,
		data: {
			"memId" : mmId,
			"prCode" : prCode
		},
		type: 'post',
		success: function(res){
			
			
			wishBox.remove();
			
		},
		error: function(xhr){
			alert(xhr.status);
		},
		dataType: 'json'	
	})
}