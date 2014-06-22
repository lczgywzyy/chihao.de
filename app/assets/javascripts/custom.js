var order = new Object();

$(document).ready(function(){
	$('#restaurant_province_id').change(function(){
		 $('#restaurant_city_id').remove();
		 $('#restaurant_ccounty_id').remove();
		 $('#city').append('<select id="restaurant_city_id" name="restaurant[city]">');
		
		 var province_id = $('#restaurant_province_id').val();

		 $.getJSON('../cities/?format=json&province_id=' + province_id, function(data){
			 var cities = [];
			 $.each( data, function( key, val ){
				 $('#city select').append('<option value="' + val[1] + '">' + val[0] + '</option>');
			 });
			 
			 $('#city option').last().append('</select></span>');
		 });
	
	})
	
	$('#city').click(function(){
		 $('#restaurant_county_id').remove();
		 $('#county').append('<select id="restaurant_county_id" name="restaurant[county]">');

		 var city_id = $('#restaurant_city_id').val();
		 
		 $.getJSON('../counties/?format=json&city_id=' + city_id, function(counties_data){
			 var counties = [];
			 $.each( counties_data, function( key, val ){
				 $('#county select').append('<option value="' + val[1] + '">' + val[0] + '</option>');
			 });
			 
			 $('#county option').last().append('</select>');
		 });
	})
	
	$('.glyphicon-ok-sign').click(function(){
		$(this).toggleClass('recipe-ordered');
	  var i = $('#cart-num').html();
		var recipe_id = $(this).data('recipe').id;
		var recipe_name = $(this).data('recipe').name;
		var recipe_price = parseInt( $(this).data('recipe').price );
		var recipe_sum = parseInt( $('#modal-cart-sum').html() );
		
    if ( $('#recipe-' + recipe_id).find('.recipe-ordered').length ){
			$('#cart-num').html( parseInt(i) + 1 );
			$('#my-order').append('<tr id="' + recipe_id + '">'  +
														'<td class="modal-recipe-name">' + recipe_name + '</td>'  +
														'<td class="modal-recipe-price">￥' + recipe_price + '</td>' +
														'<td><button id="modal-recipe-minus" data-recipeid="' + recipe_id + '" class="btn btn-info btn-xs">-</button>' + 
														'<input id="modal-recipe-count-'+ recipe_id + '" type="text" class="modal-recipe-count form-control" value="1"></input>'+
														'<button id="modal-recipe-plus" data-recipeid="' + recipe_id + '" class="btn btn-info btn-xs">+</button></td>' +
													  '<td><input id="modal-recipe-checkbox-' + recipe_id + '" type="checkbox" checked="true"></td></tr>');
			
			$('#modal-cart-sum').html(recipe_sum + recipe_price);
			order[recipe_id] = 1;
		} else {
			$('#cart-num').html( parseInt(i) - 1 );
			$('#cart-modal #' + recipe_id).remove();
			$('#modal-cart-sum').html(recipe_sum - recipe_price);
			order[recipe_id] = 0;
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
		
		order[recipe_id] = recipe_count;
		$.cookie('order',$.toJSON(order) );
	});
	
	
	$('#my-order').on('click', '#modal-recipe-plus', function () {
			var recipe_id =  $(this).data('recipeid');
			var recipe_count = $('#modal-recipe-count-' + recipe_id ).val();
		
			recipe_count = parseInt(recipe_count);
			recipe_count++;
			$('#modal-recipe-checkbox-' + recipe_id).prop('checked',true) ;
			$('#modal-recipe-count-' + recipe_id ).val(recipe_count);

			order[recipe_id] = recipe_count;
			$.cookie('order',$.toJSON(order) );
	});
	
	
})
