$(".students.new").ready(function() {
	getSections($("#year_level_id option:selected").val());

	$("#year_level_id").change(function() {
		getSections($("#year_level_id option:selected").val());
	});
});

$(".students.edit").ready(function() {
	getSections($("#year_level_id option:selected").val());

	$("#year_level_id").change(function() {
		getSections($("#year_level_id option:selected").val());
	});
});

function getSections(grade) {
	if(grade == 7) {
		$("#section_id").html('<option value="2">Faith</option><option value="3">Love</option>');
	}
	else if(grade == 8) {
		$("#section_id").html('<option value="4">Hope</option><option value="5">Joy</option>');
	}
	else if(grade == 9) {
		$("#section_id").html('<option value="6">Humility</option>');
	}
	else if(grade == 10) {
		$("#section_id").html('<option value="7">Kindness</option><option value="7">Peace</option>');
	}
	else {
		$("#section_id").html('<option value="1">No Section</option>');
	}
}