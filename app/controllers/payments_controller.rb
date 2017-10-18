class PaymentsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def pay
		tuition_fee = Payment.new(or_number: params[:or_number], 
					description: "Tuition Fee", 
					amount: params[:txt_tuition_fee], 
					payment_date: Time.now, 
					school_year: params[:school_year])

		registration_fee = Payment.new(or_number: params[:or_number],
					description: "Registration Fee",
					amount: params[:txt_registration_fee],
					payment_date: Time.now,
					school_year: params[:school_year])

		miscellaneous = Payment.new(or_number: params[:or_number],
					description: "Miscellaneous Fee",
					amount: params[:txt_registration_fee],
					payment_date: Time.now,
					school_year: params[:school_year])
		
		books = Payment.new(or_number: params[:or_number],
					description: "Books",
					amount: params[:txt_books],
					payment_date: Time.now,
					school_year: params[:school_year])

		school_service_fee = Payment.new(or_number: params[:or_number],
					description: "School Service Fee",
					amount: params[:txt_school_service_fee],
					payment_date: Time.now,
					school_year: params[:school_year])

		aircon_fee = Payment.new(or_number: params[:or_number],
					description: "Aircon Fee",
					amount: params[:txt_aircon_fee],
					payment_date: Time.now,
					school_year: params[:school_year])

		security_guard_fee = Payment.new(or_number: params[:or_number],
					description: "Security Guard Fee",
					amount: params[:txt_security_guard_fee],
					payment_date: Time.now,
					school_year: params[:school_year])

		janitors_fee = Payment.new(or_number: params[:or_number],
					description: "Janitors Fee",
					amount: params[:txt_janitors_fee],
					payment_date: Time.now,
					school_year: params[:school_year])

		school_uniforms = Payment.new(or_number: params[:or_number],
					description: "School Uniforms",
					amount: params[:txt_school_uniforms],
					payment_date: Time.now,
					school_year: params[:school_year])

		
		begin
			tuition_fee.save 		if params[:txt_tuition_fee].to_i > 0
			registration_fee.save 	if params[:txt_registration_fee].to_i > 0
			miscellaneous.save 		if params[:txt_miscellaneous].to_i > 0
			books.save 				if params[:txt_books].to_i > 0
			school_service_fee.save if params[:txt_school_service_fee].to_i > 0
			aircon_fee.save 		if params[:txt_aircon_fee].to_i > 0
			security_guard_fee.save if params[:txt_security_guard_fee].to_i > 0
			janitors_fee.save 		if params[:txt_janitors_fee].to_i > 0
			school_uniforms.save 	if params[:txt_school_uniforms].to_i > 0
		
			redirect_to "/students"
		rescue
			puts "error"
			redirect_to "/"
		end
	end
end