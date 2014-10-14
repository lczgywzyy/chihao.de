

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

})