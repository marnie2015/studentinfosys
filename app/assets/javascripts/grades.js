$(".grades.show").ready(function() {
	//click edit
	$(".edit").click(function() {
		var nme = $(this).data("name");

		$(".edit" + nme).addClass("hidden");
		$(".save" + nme).removeClass("hidden");
		$(".cancel" + nme).removeClass("hidden");

		$("#" + nme).attr("disabled", false);
	});

	//click cancel
	$(".cancel").click(function() {
		var nme = $(this).data("name");

		$(".edit" + nme).removeClass("hidden");
		$(".save" + nme).addClass("hidden");
		$(".cancel" + nme).addClass("hidden");

		$("#" + nme).attr("disabled", true);
	});

	//change school year
	$("#school_year_form").change(function(){
		$(this).submit();
	});
});