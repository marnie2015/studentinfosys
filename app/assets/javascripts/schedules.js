$(".schedules.show").ready(function() {
	//change school year
	$("#school_year_form").change(function(){
		$(this).submit();
	});
});