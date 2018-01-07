$(".schedules.show").ready(function() {
	//change school year
	$("#school_year_form").change(function(){
		$(this).submit();
	});
});
$(".schedules.student_show").ready(function() {
	//change school year
	$("#school_year_form").change(function(){
		$(this).submit();
	});
});
$(".schedules.new").ready(function() {
	//change school year
	$(".schedule_year_level_id").change(function(){
		getSections($(this).val(), $(this).data("target"));
	});
});

function getSections(grade, target) {
	$.get("/get-sections?grade=" + grade, function(result) {
		$(target).html(result);
	});
}