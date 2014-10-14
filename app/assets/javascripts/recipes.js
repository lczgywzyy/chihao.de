

$(document).ready(function(){
	
	$.cookie('order', '');
	
	
	$('.glyphicon-ok-sign').click(function(){
		$(this).toggleClass('recipe-ordered');
	  var i = $('#cart-num').html();
		var recipe_id = $(this).data('recipe').id;
		var recipe_name = $(this).data('recipe').name;
		var recipe_price = parseInt( $(this).data('recipe').price );
		var recipe_sum = parseInt( $('#modal-cart-sum').html() );
		
    if ( $('#recipe-' + recipe_id).find('.recipe-ordered').length ){
			$('#cart-num').html( parseInt(i) + 1 );
			$('#orders-num').val( parseInt(i) + 1 );
 			$('#my-order').append('<tr id="' + recipe_id + '">'       +
														'<td class="modal-recipe-name">'    + recipe_name   + '</td>'  +
														'<input name="specifications[' + i + '][recipe_id]" type="hidden" value="' + recipe_id     + '"/>'    + 
														'<td class="modal-recipe-price">￥' + recipe_price   + '</td>'  +
														'<input name="specifications[' + i + '][price]" type="hidden" value="'      + recipe_price   + '"/>'    +
														'<td><button id="modal-recipe-minus" data-recipeid="' + recipe_id + '" class="btn btn-info btn-xs">-</button>' + 
														'<input name="specifications[' + i + '][count]" id="modal-recipe-count-'+ recipe_id + '" type="text" class="modal-recipe-count form-control" value="1"></input>'+
														'<button id="modal-recipe-plus" data-recipeid="' + recipe_id + '" class="btn btn-info btn-xs">+</button></td>' +
													  '<td><input id="modal-recipe-checkbox-' + recipe_id + '" type="checkbox" checked="true"></td></tr>');
			
			$('#modal-cart-sum').html(recipe_sum + recipe_price);
			order[recipe_id] = { count:1, 
				                   price:recipe_price };
		
		} else {
			$('#cart-num').html( parseInt(i) - 1 );
			$('#orders-num').val( parseInt(i) - 1  );
			$('#cart-modal #' + recipe_id).remove();
			$('#modal-cart-sum').html(recipe_sum - recipe_price);
			order[recipe_id]['count'] = 0;
		}
		
		$.cookie('order',$.toJSON(order) );
		
	});
	
	
	
	$('#modal-cancel').click(function(){
		$('#cart-modal tr').remove();
		$('#cart-num').html('0');
		$('.glyphicon-ok-sign').removeClass('recipe-ordered');
		$('#modal-cart-sum').html(0);
		
		$.removeCookie('order');
	});

	
	$('#my-order').on('click', '#modal-recipe-minus', function () {
		var recipe_id =  $(this).data('recipeid');
		var recipe_count = $('#modal-recipe-count-' + recipe_id ).val();
		
		recipe_count = parseInt(recipe_count);
		if (recipe_count>1){
			recipe_count--;
		} else {
			recipe_count = 0;
			$('#modal-recipe-checkbox-' + recipe_id).prop('checked',false) ;
		}
		
		$('#modal-recipe-count-' + recipe_id ).val(recipe_count);
		
		order[recipe_id]['count'] = recipe_count;
		$.cookie('order',$.toJSON(order) );
	});
	
	
	$('#my-order').on('click', '#modal-recipe-plus', function () {
			var recipe_id =  $(this).data('recipeid');
			var recipe_count = $('#modal-recipe-count-' + recipe_id ).val();
		
			recipe_count = parseInt(recipe_count);
			recipe_count++;
			$('#modal-recipe-checkbox-' + recipe_id).prop('checked',true) ;
			$('#modal-recipe-count-' + recipe_id ).val(recipe_count);

			order[recipe_id]['count'] = recipe_count;
			$.cookie('order',$.toJSON(order) );
	});
	
	
})
