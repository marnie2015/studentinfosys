$(".payments.index").ready(function() {
	var total = 0;
	$("#tuition_fee").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_tuition_fee'><td>Tuition Fee</td><td>100</td></tr>");
			$("#txt_tuition_fee").val(100);
			total += 100;
		} else {
			$("#tr_tuition_fee").remove();
			$("#txt_tuition_fee").val(0);
			total -= 100;
		}
		$("#span_total").text(total);
	});

	$("#registration_fee").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_registration_fee'><td>Tuition Fee</td><td>100</td></tr>");
			$("#txt_registration_fee").val(100);
			total += 100;
		} else {
			$("#tr_registration_fee").remove();
			$("#txt_registration_fee").val(0);
			total -= 100;
		}
		$("#span_total").text(total);
	});

	$("#miscellaneous").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_miscellaneous'><td>Miscellaneous</td><td>100</td></tr>");
			$("#txt_miscellaneous").val(100);
			total += 100;
		} else {
			$("#tr_miscellaneous").remove();
			$("#txt_miscellaneous").val(0);
			total -= 100;
		}
		$("#span_total").text(total);
	});

	$("#books").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_books'><td>Books</td><td>100</td></tr>");
			$("#txt_books").val(100);
			total += 100;
		} else {
			$("#tr_books").remove();
			$("#txt_books").val(0);
			total -= 100;
		}
		$("#span_total").text(total);
	});

	$("#school_service_fee").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_school_service_fee'><td>School Service Fee</td><td>100</td></tr>");
			$("#txt_school_service_fee").val(100);
			total += 100;
		} else {
			$("#tr_school_service_fee").remove();
			$("#txt_school_service_fee").val(0);
			total -= 100;
		}
		$("#span_total").text(total);
	});

	$("#aircon_fee").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_aircon_fee'><td>Aircon Fee</td><td>100</td></tr>");
			$("#txt_aircon_fee").val(100);
			total += 100;
		} else {
			$("#tr_aircon_fee").remove();
			$("#txt_aircon_fee").val(0);
			total -= 100;
		}
		$("#span_total").text(total);
	});

	$("#security_guard_fee").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_security_guard_fee'><td>Security Guard Fee</td><td>100</td></tr>");
			$("#txt_security_guard_fee").val(100);
			total += 100;
		} else {
			$("#tr_security_guard_fee").remove();
			$("#txt_security_guard_fee").val(0);
			total -= 100;
		}
		$("#span_total").text(total);
	});
	
	$("#janitors_fee").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_janitors_fee'><td>Janitors Fee</td><td>100</td></tr>");
			$("#txt_janitors_fee").val(100);
			total += 100;
		} else {
			$("#tr_janitors_fee").remove();
			$("#txt_janitors_fee").val(0);
			total -= 100;
		}
		$("#span_total").text(total);
	});

	$("#school_uniforms").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_school_uniforms'><td>School Uniforms</td><td>100</td></tr>");
			$("#txt_school_uniforms").val(100);
			total += 100;
		} else {
			$("#tr_school_uniforms").remove();
			$("#txt_school_uniforms").val(0);
			total -= 100;
		}
		$("#span_total").text(total);
	});

	// $("#books").change(function() {
	// 	if ($(this).is(":checked")) {
	// 		$("#breakdown").append("<tr id='tr_books'><td>Books</td><td>100</td></tr>");
	// 		total += 100;
	// 	} else {
	// 		$("#tr_books").remove();
	// 		total -= 100;
	// 	}
	// 	$("#span_total").text(total);
	// });

	$("#btn_yes").click(function() {
		$("#pay_form").submit();
	});
	
});