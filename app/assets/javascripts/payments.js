$(".payments.payform").ready(function() {
	var total = 0;
	$("#tuition_fee").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_tuition_fee'><td>Tuition Fee</td><td>450</td></tr>");
			$("#txt_tuition_fee").val(450);
			total += 450;
		} else {
			$("#tr_tuition_fee").remove();
			$("#txt_tuition_fee").val(0);
			total -= 450;
		}
		$("#span_total").text(total);
	});

	$("#registration_fee").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_registration_fee'><td>Registration Fee</td><td>250</td></tr>");
			$("#txt_registration_fee").val(250);
			total += 250;
		} else {
			$("#tr_registration_fee").remove();
			$("#txt_registration_fee").val(0);
			total -= 250;
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
			$("#breakdown").append("<tr id='tr_school_service_fee'><td>School Service Fee</td><td>700</td></tr>");
			$("#txt_school_service_fee").val(700);
			total += 700;
		} else {
			$("#tr_school_service_fee").remove();
			$("#txt_school_service_fee").val(0);
			total -= 700;
		}
		$("#span_total").text(total);
	});

	$("#aircon_fee").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_aircon_fee'><td>Aircon Fee</td><td>600</td></tr>");
			$("#txt_aircon_fee").val(600);
			total += 600;
		} else {
			$("#tr_aircon_fee").remove();
			$("#txt_aircon_fee").val(0);
			total -= 600;
		}
		$("#span_total").text(total);
	});

	$("#security_guard_fee").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_security_guard_fee'><td>Security Guard Fee</td><td>200</td></tr>");
			$("#txt_security_guard_fee").val(200);
			total += 200;
		} else {
			$("#tr_security_guard_fee").remove();
			$("#txt_security_guard_fee").val(0);
			total -= 200;
		}
		$("#span_total").text(total);
	});
	
	$("#janitors_fee").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_janitors_fee'><td>Janitors Fee</td><td>150</td></tr>");
			$("#txt_janitors_fee").val(150);
			total += 150;
		} else {
			$("#tr_janitors_fee").remove();
			$("#txt_janitors_fee").val(0);
			total -= 150;
		}
		$("#span_total").text(total);
	});

	$("#school_uniforms").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_school_uniforms'><td>School Uniforms</td><td>500</td></tr>");
			$("#txt_school_uniforms").val(500);
			total += 500;
		} else {
			$("#tr_school_uniforms").remove();
			$("#txt_school_uniforms").val(0);
			total -= 500;
		}
		$("#span_total").text(total);
	});

	$("#male_su_grade1to6").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_male_su_grade1to6'><td>Male School Uniforms Grade 1 to 6</td><td>500</td></tr>");
			$("#txt_male_su_grade1to6").val(500);
			total += 500;
		} else {
			$("#tr_male_su_grade1to6").remove();
			$("#txt_male_su_grade1to6").val(0);
			total -= 500;
		}
		$("#span_total").text(total);
	});

	$("#male_su_grade7to10").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_male_su_grade7to10'><td>Male School Uniforms Grade 7 to 10</td><td>550</td></tr>");
			$("#txt_male_su_grade7to10").val(550);
			total += 550;
		} else {
			$("#tr_male_su_grade7to10").remove();
			$("#txt_male_su_grade7to10").val(0);
			total -= 550;
		}
		$("#span_total").text(total);
	});

	$("#male_su_grade11to12").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_male_su_grade11to12'><td>Male School Uniforms Grade 11 to 12</td><td>600</td></tr>");
			$("#txt_male_su_grade11to12").val(600);
			total += 600;
		} else {
			$("#tr_male_su_grade11to12").remove();
			$("#txt_male_su_grade11to12").val(0);
			total -= 600;
		}
		$("#span_total").text(total);
	});

	$("#female_su_grade1to6").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_female_su_grade1to6'><td>Female School Uniforms Grade 1 to 6</td><td>500</td></tr>");
			$("#txt_female_su_grade1to6").val(500);
			total += 500;
		} else {
			$("#tr_female_su_grade1to6").remove();
			$("#txt_female_su_grade1to6").val(0);
			total -= 500;
		}
		$("#span_total").text(total);
	});

	$("#female_su_grade7to10").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_female_su_grade7to10'><td>Female School Uniforms Grade 7 to 10</td><td>550</td></tr>");
			$("#txt_female_su_grade7to10").val(550);
			total += 550;
		} else {
			$("#tr_female_su_grade7to10").remove();
			$("#txt_female_su_grade7to10").val(0);
			total -= 550;
		}
		$("#span_total").text(total);
	});

	$("#female_su_grade11to12").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_female_su_grade11to12'><td>Female School Uniforms Grade 11 to 12</td><td>600</td></tr>");
			$("#txt_female_su_grade11to12").val(600);
			total += 600;
		} else {
			$("#tr_female_su_grade11to12").remove();
			$("#txt_female_su_grade11to12").val(0);
			total -= 600;
		}
		$("#span_total").text(total);
	});

	//BOOKS
	$("#books_grade1").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_books_grade1'><td>Books Grade 1</td><td>300</td></tr>");
			$("#txt_books_grade1").val(300);
			total += 300;
		} else {
			$("#tr_books_grade1").remove();
			$("#txt_books_grade1").val(0);
			total -= 300;
		}
		$("#span_total").text(total);
	});

	$("#books_grade2").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_books_grade2'><td>Books Grade 2</td><td>300</td></tr>");
			$("#txt_books_grade2").val(300);
			total += 300;
		} else {
			$("#tr_books_grade2").remove();
			$("#txt_books_grade2").val(0);
			total -= 300;
		}
		$("#span_total").text(total);
	});

	$("#books_grade3").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_books_grade3'><td>Books Grade 3</td><td>300</td></tr>");
			$("#txt_books_grade3").val(300);
			total += 300;
		} else {
			$("#tr_books_grade3").remove();
			$("#txt_books_grade3").val(0);
			total -= 300;
		}
		$("#span_total").text(total);
	});

	$("#books_grade4").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_books_grade4'><td>Books Grade 4</td><td>350</td></tr>");
			$("#txt_books_grade4").val(350);
			total += 350;
		} else {
			$("#tr_books_grade4").remove();
			$("#txt_books_grade4").val(0);
			total -= 350;
		}
		$("#span_total").text(total);
	});

	$("#books_grade5").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_books_grade5'><td>Books Grade 5</td><td>350</td></tr>");
			$("#txt_books_grade5").val(350);
			total += 350;
		} else {
			$("#tr_books_grade5").remove();
			$("#txt_books_grade5").val(0);
			total -= 350;
		}
		$("#span_total").text(total);
	});

	$("#books_grade6").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_books_grade6'><td>Books Grade 6</td><td>350</td></tr>");
			$("#txt_books_grade6").val(350);
			total += 350;
		} else {
			$("#tr_books_grade6").remove();
			$("#txt_books_grade6").val(0);
			total -= 350;
		}
		$("#span_total").text(total);
	});

	$("#books_grade7").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_books_grade7'><td>Books Grade 7</td><td>300</td></tr>");
			$("#txt_books_grade7").val(300);
			total += 300;
		} else {
			$("#tr_books_grade7").remove();
			$("#txt_books_grade7").val(0);
			total -= 300;
		}
		$("#span_total").text(total);
	});

	$("#books_grade8").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_books_grade8'><td>Books Grade 8</td><td>300</td></tr>");
			$("#txt_books_grade8").val(300);
			total += 300;
		} else {
			$("#tr_books_grade8").remove();
			$("#txt_books_grade8").val(0);
			total -= 300;
		}
		$("#span_total").text(total);
	});

	$("#books_grade9").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_books_grade9'><td>Books Grade 9</td><td>350</td></tr>");
			$("#txt_books_grade9").val(350);
			total += 350;
		} else {
			$("#tr_books_grade9").remove();
			$("#txt_books_grade9").val(0);
			total -= 350;
		}
		$("#span_total").text(total);
	});

	$("#books_grade10").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_books_grade10'><td>Books Grade 10</td><td>350</td></tr>");
			$("#txt_books_grade10").val(350);
			total += 350;
		} else {
			$("#tr_books_grade10").remove();
			$("#txt_books_grade10").val(0);
			total -= 350;
		}
		$("#span_total").text(total);
	});

	$("#books_grade11").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_books_grade11'><td>Books Grade 11</td><td>400</td></tr>");
			$("#txt_books_grade11").val(400);
			total += 400;
		} else {
			$("#tr_books_grade11").remove();
			$("#txt_books_grade11").val(0);
			total -= 400;
		}
		$("#span_total").text(total);
	});

	$("#books_grade12").change(function() {
		if ($(this).is(":checked")) {
			$("#breakdown").append("<tr id='tr_books_grade12'><td>Books Grade 12</td><td>400</td></tr>");
			$("#txt_books_grade12").val(400);
			total += 400;
		} else {
			$("#tr_books_grade12").remove();
			$("#txt_books_grade12").val(0);
			total -= 400;
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

	$("#btn_pay").click(function() {
		if($("#or_number").val()== "") {
			alert("Please fill out OR Number!");
		}
		else if($("#span_total").text() == "0") {
			alert("Please select an accounts payable!");
		}
		else {
			$("#modal_yes_no").modal({backdrop: 'static', keyboard: false});
		}
	});

	$("#btn_yes").click(function() {
		$("#pay_form").submit();
	});

	$("#btn_no").click(function() {
		$("#modal_yes_no").modal("hide");
	});
	
});

//   start of /payments/:id

$(".payments.history").ready(function() {
	$(".btn_view_history").click(function() {
		var or_number = $(this).data("or");
		var obj, html;
		//var html = 'sadf';
		$.get("/get-payment?or_number=" + or_number, function(result) {
			obj = JSON.parse(result);
			for(var x=0;x<obj.length;x++) {
				html+="<tr><td>" + obj[x].description + "</td><td>" + obj[x].amount + "</td></tr>"
			}
			$("#modal_title").html(or_number);
			$("#abtn_print").attr("href", "/payments/print/" + or_number);
			$("#tbl_payment_history").html(html);
			$("#modal_history").modal({backdrop: 'static'});
		});
		
	});
});