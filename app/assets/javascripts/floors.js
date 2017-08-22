document.addEventListener("turbolinks:load", function(){
	$('#month_month_id').change(function(){
		var data = {month_id: $('#month_month_id :selected').val(), floor_id: $('#floor_id').val()};
		if(data['month_id'] != ''){
			$.ajax({
        url: '/floors/water_meter_reading',
        data: data,
        datatype: "JSON"
      }).success(function(json){
        if(json != 0)
        {
          $("#water_readings_partial").html(json).show(); 
        }
        else
        { 
          $("#water_readings_partial").empty(); 
        }
      });
		}
	});
});