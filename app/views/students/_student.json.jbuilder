json.extract! student, :id, :fname, :mname, :lname, :birthdate, :gender, :address_1, :address_2, :contact_1, :contact_2, :user_name, :user_pass, :status, :created_at, :updated_at
json.url student_url(student, format: :json)
