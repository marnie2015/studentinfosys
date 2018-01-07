$(".students.new").ready(function() {
	getSections($("#year_level_id option:selected").val(), "#section_id");

	$("#year_level_id").change(function() {
		getSections($("#year_level_id option:selected").val(), "#section_id");
	});
});

$(".students.edit").ready(function() {
	getSections($("#year_level_id option:selected").val(), "#section_id");

	$("#year_level_id").change(function() {
		getSections($("#year_level_id option:selected").val(), "#section_id");
	});
});

function getSections(grade, target) {
	$.get("/get-sections?grade=" + grade, function(result) {
		$(target).html(result);
	});
}