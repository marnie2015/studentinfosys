class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  

  def check_access
    if session[:user].nil?
      render file: "public/404.html", layout: false
    elsif session[:user]["access"] == 3 #student
      @session_student = Student.joins(:student_year_sections => [:year_level]).
                        select("students.id, 
                                  students.student_id, 
                                  students.fname, 
                                  students.mname, 
                                  students.lname, 
                                  students.address,
                                  students.status, 
                                  student_year_sections.year_level_id,
                                  student_year_sections.section_id").
                                  find_by_user_id(session[:user]["id"])
    end
  end

  def student_access_only
      render file: "public/404.html", layout: false if session[:user]["access"] != 3
  end

  def admin_access_only
      render file: "public/404.html", layout: false if session[:user]["access"] != 1
  end
end
