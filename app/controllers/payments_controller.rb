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

		male_su_grade1to6 = Payment.new(or_number: params[:or_number],
					description: "Male School Uniforms Grade 1 to 6",
					amount: params[:txt_male_su_grade1to6],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])
		
		male_su_grade7to10 = Payment.new(or_number: params[:or_number],
					description: "Male School Uniforms Grade 7 to 10",
					amount: params[:txt_male_su_grade7to10],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		male_su_grade11to12 = Payment.new(or_number: params[:or_number],
					description: "Male School Uniforms Grade 11 to 12",
					amount: params[:txt_male_su_grade11to12],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		female_su_grade1to6 = Payment.new(or_number: params[:or_number],
					description: "Female School Uniforms Grade 1 to 6",
					amount: params[:txt_female_su_grade1to6],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])
		
		female_su_grade7to10 = Payment.new(or_number: params[:or_number],
					description: "Female School Uniforms Grade 7 to 10",
					amount: params[:txt_female_su_grade7to10],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		female_su_grade11to12 = Payment.new(or_number: params[:or_number],
					description: "Female School Uniforms Grade 11 to 12",
					amount: params[:txt_female_su_grade11to12],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		books_grade1 = Payment.new(or_number: params[:or_number],
					description: "Books Grade 1",
					amount: params[:txt_books_grade1],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])
					
		books_grade2 = Payment.new(or_number: params[:or_number],
					description: "Books Grade 2",
					amount: params[:txt_books_grade2],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		books_grade3 = Payment.new(or_number: params[:or_number],
					description: "Books Grade 3",
					amount: params[:txt_books_grade3],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		books_grade4 = Payment.new(or_number: params[:or_number],
					description: "Books Grade 4",
					amount: params[:txt_books_grade4],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		books_grade5 = Payment.new(or_number: params[:or_number],
					description: "Books Grade 5",
					amount: params[:txt_books_grade5],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		books_grade6 = Payment.new(or_number: params[:or_number],
					description: "Books Grade 6",
					amount: params[:txt_books_grade6],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		books_grade7 = Payment.new(or_number: params[:or_number],
					description: "Books Grade 7",
					amount: params[:txt_books_grade7],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		books_grade8 = Payment.new(or_number: params[:or_number],
					description: "Books Grade 8",
					amount: params[:txt_books_grade8],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		books_grade9 = Payment.new(or_number: params[:or_number],
					description: "Books Grade 9",
					amount: params[:txt_books_grade9],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		books_grade10 = Payment.new(or_number: params[:or_number],
					description: "Books Grade 10",
					amount: params[:txt_books_grade10],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		books_grade11 = Payment.new(or_number: params[:or_number],
					description: "Books Grade 11",
					amount: params[:txt_books_grade11],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		books_grade12 = Payment.new(or_number: params[:or_number],
					description: "Books Grade 12",
					amount: params[:txt_books_grade12],
					payment_date: Time.now,
					school_year: params[:school_year],
					:student_id => params[:student_id])

		
		begin
			tuition_fee.save 		if params[:txt_tuition_fee].to_i > 0
			registration_fee.save 	if params[:txt_registration_fee].to_i > 0
			miscellaneous.save 		if params[:txt_miscellaneous].to_i > 0
			school_service_fee.save if params[:txt_school_service_fee].to_i > 0
			aircon_fee.save 		if params[:txt_aircon_fee].to_i > 0
			security_guard_fee.save if params[:txt_security_guard_fee].to_i > 0
			janitors_fee.save 		if params[:txt_janitors_fee].to_i > 0
			male_su_grade1to6.save 	if params[:txt_male_su_grade1to6].to_i > 0
			male_su_grade7to10.save 	if params[:txt_male_su_grade7to10].to_i > 0
			male_su_grade11to12.save 	if params[:txt_male_su_grade11to12].to_i > 0
			female_su_grade1to6.save 	if params[:txt_female_su_grade1to6].to_i > 0
			female_su_grade7to10.save 	if params[:txt_male_su_grade7to10].to_i > 0
			female_su_grade11to12.save 	if params[:txt_male_su_grade11to12].to_i > 0
			books_grade1.save 				if params[:txt_books_grade1].to_i > 0
			books_grade2.save 				if params[:txt_books_grade2].to_i > 0
			books_grade3.save 				if params[:txt_books_grade3].to_i > 0
			books_grade4.save 				if params[:txt_books_grade4].to_i > 0
			books_grade5.save 				if params[:txt_books_grade5].to_i > 0
			books_grade6.save 				if params[:txt_books_grade6].to_i > 0
			books_grade7.save 				if params[:txt_books_grade7].to_i > 0
			books_grade8.save 				if params[:txt_books_grade8].to_i > 0
			books_grade9.save 				if params[:txt_books_grade9].to_i > 0
			books_grade10.save 				if params[:txt_books_grade10].to_i > 0
			books_grade11.save 				if params[:txt_books_grade11].to_i > 0
			books_grade12.save 				if params[:txt_books_grade12].to_i > 0
		
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
		
		@payments = Payment.where(:student_id => params[:student_id], :school_year => params[:school_year])
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

	def print
		@payments = Payment.where(:or_number => params[:or_number])
		render layout: false
	end

	#javascript call
	def get_payment
		@payment = Payment.where(:or_number => params[:or_number])
		render inline: @payment.to_json
	end
end