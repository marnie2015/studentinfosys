class GradesController < ApplicationController
  def index
    @students = Student.paginate(:page => params[:page], :per_page => 20)
  end
  
  def show
    @student = Student.joins(:student_year_sections => [:year_level, :section]).
                        select("students,fname, students.mname, students.lname, students.id, 
                                sections.description section, 
                                year_levels.description year_level").
                        find(params[:id])
                  
  end
end
