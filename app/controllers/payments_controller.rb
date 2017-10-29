class PaymentsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@students = Student.index_fields.paginate(:page => params[:page], :per_page => 20)
		if params[:txt_search]
			@students = Student.index_fields.where("students.fname ilike ?", "#{params[:txt_search]}%").paginate(:page => params[:page], :per_page => 20) if params[:searchby] == "fname"
			@students = Student.index_fields.where("students.lname ilike ?", "#{params[:txt_search]}%").paginate(:page => params[:page], :per_page => 20) if params[:searchby] == "lname"
			@students = Student.index_fields.where("year_levels.description ilike ?", "#{params[:txt_search]}").paginate(:page => params[:page], :per_page => 20) if params[:searchby] == "year_level"
		end
	end

	def pay
		tuition_fee = Payment.new(or_number: params[:or_number], 
					description: "Tuition Fee", 
					amount: params[:txt_tuition_fee], 
					payment_date: Time.now, 
					school_year: params[:school_year],
					:student_id => params[:student_id])

		registration_fee = Payment.new(or_number: params[:or_number],
					description: "Registration Fee",
					amount: params[:txt_registration_fee],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		miscellaneous = Payment.new(or_number: params[:or_number],
					description: "Miscellaneous Fee",
					amount: params[:txt_registration_fee],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])
		
		books = Payment.new(or_number: params[:or_number],
					description: "Books",
					amount: params[:txt_books],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		school_service_fee = Payment.new(or_number: params[:or_number],
					description: "School Service Fee",
					amount: params[:txt_school_service_fee],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		aircon_fee = Payment.new(or_number: params[:or_number],
					description: "Aircon Fee",
					amount: params[:txt_aircon_fee],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		security_guard_fee = Payment.new(or_number: params[:or_number],
					description: "Security Guard Fee",
					amount: params[:txt_security_guard_fee],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		janitors_fee = Payment.new(or_number: params[:or_number],
					description: "Janitors Fee",
					amount: params[:txt_janitors_fee],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		school_uniforms = Payment.new(or_number: params[:or_number],
					description: "School Uniforms",
					amount: params[:txt_school_uniforms],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		
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
		
			redirect_to "/payments"
		rescue
			puts "error"
			redirect_to "/"
		end
	end

	def payform
		@student = Student.joins(:student_year_sections => [:year_level, :section]).
					select("students.fname, students.mname, students.lname, students.id, 
							sections.description section, 
							year_levels.description year_level").
					find(params[:student_id])
		
		@payments = Payment.where(:student_id => params[:student_id], :school_year => "2016-2017")
	end

	def history
		year_now = Time.now.year
		current_school_year = year_now.to_s + "-" + (year_now + 1.year).to_s
		@student = Student.joins(:student_year_sections => [:year_level, :section]).
					select("students.fname, students.mname, students.lname, students.id, 
							sections.description section, 
							year_levels.description year_level").
					find(params[:student_id])
		@payments = Payment.where(:student_id => params[:student_id]).select(:or_number, :payment_date, :school_year).distinct
	end

	def get_payment
		@payment = Payment.where(:or_number => params[:or_number])
		render inline: @payment.to_json
	end
end