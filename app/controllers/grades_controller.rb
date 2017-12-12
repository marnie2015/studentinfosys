class GradesController < ApplicationController
  before_filter :check_access
  
  def index
    @students = Student.paginate(:page => params[:page], :per_page => 20)
    # if params[:txt_search]
    #   @students = Student.index_fields.where("students.fname ilike ?", "#{params[:txt_search]}%").paginate(:page => params[:page], :per_page => 20) if params[:searchby] == "fname"
    #   @students = Student.index_fields.where("students.lname ilike ?", "#{params[:txt_search]}%").paginate(:page => params[:page], :per_page => 20) if params[:searchby] == "lname"
    #   @students = Student.index_fields.where("year_levels.description ilike ?", "#{params[:txt_search]}").paginate(:page => params[:page], :per_page => 20) if params[:searchby] == "year_level"
    # end
    if params[:txt_search]
      @students = Student.index_fields.where("students.fname ilike ? or students.lname ilike ?", "#{params[:txt_search]}%", "#{params[:txt_search]}%").paginate(:page => params[:page], :per_page => 20) if params[:searchby] == "fname"
    end
  end
  
  def show
    if session["user"]["access"] == 2
    t = Teacher.joins(:position, :subject, :room).select("teachers.id, subjects.id subject_id").find_by_user_id(session["user"]["id"])
    @teacher = t.subject_id
    else
    @teacher = 0
    end

    @student = Student.joins(:student_year_sections => [:year_level, :section]).
                        select("students,fname, students.mname, students.lname, students.id, 
                                sections.description section, 
                                year_levels.description year_level").
                        find(params[:id])

    sy = Time.now.year.to_s + "-" + (Time.now + 1.year).year.to_s
    if params[:school_year]
      sy = params[:school_year]
    end
    @grade = Grade.where(:student_id => params[:id], :school_year => sy).first
    if @grade
    @computer1 = @grade.computer1
    @computer2 = @grade.computer2
    @computer3 = @grade.computer3
    @computer4 = @grade.computer4
    @english1 = @grade.english1
    @english2 = @grade.english2
    @english3 = @grade.english3
    @english4 = @grade.english4
    @epp1 = @grade.epp1
    @epp2 = @grade.epp2
    @epp3 = @grade.epp3
    @epp4 = @grade.epp4
    @filipino1 = @grade.filipino1
    @filipino2 = @grade.filipino2
    @filipino3 = @grade.filipino3
    @filipino4 = @grade.filipino4
    @mapeh1 = @grade.mapeh1
    @mapeh2 = @grade.mapeh2
    @mapeh3 = @grade.mapeh3
    @mapeh4 = @grade.mapeh4
    @mathematics1 = @grade.mathematics1
    @mathematics2 = @grade.mathematics2
    @mathematics3 = @grade.mathematics3
    @mathematics4 = @grade.mathematics4
    @mother_tongue1 = @grade.mother_tongue1
    @mother_tongue2 = @grade.mother_tongue2
    @mother_tongue3 = @grade.mother_tongue3
    @mother_tongue4 = @grade.mother_tongue4
    @science1 = @grade.science1
    @science2 = @grade.science2
    @science3 = @grade.science3
    @science4 = @grade.science4
    @sibika1 = @grade.sibika1
    @sibika2 = @grade.sibika2
    @sibika3 = @grade.sibika3
    @sibika4 = @grade.sibika4
    @tle1 = @grade.tle1
    @tle2 = @grade.tle2
    @tle3 = @grade.tle3
    @tle4 = @grade.tle4
    end       
  end

  # start of javascript calls
  def save_grade
    @grade = Grade.where(:student_id => params[:student_id], :school_year => params[:school_year]).first
    if @grade
      @grade.update(grade_params)
    else
      Grade.new(grade_params).save
    end

    render inline: "ok"
  end
  # end of javascript calls

  private
    def grade_params
      params.permit(:computer1,
                    :computer2,
                    :computer3,
                    :computer4,
                    :english1,
                    :english2,
                    :english3,
                    :english4,
                    :epp1,
                    :epp2,
                    :epp3,
                    :epp4,
                    :filipino1,
                    :filipino2,
                    :filipino3,
                    :filipino4,
                    :mapeh1,
                    :mapeh2,
                    :mapeh3,
                    :mapeh4,
                    :mathematics1,
                    :mathematics2,
                    :mathematics3,
                    :mathematics4,
                    :mother_tongue1,
                    :mother_tongue2,
                    :mother_tongue3,
                    :mother_tongue4,
                    :science1,
                    :science2,
                    :science3,
                    :science4,
                    :sibika1,
                    :sibika2,
                    :sibika3,
                    :sibika4,
                    :tle1,
                    :tle2,
                    :tle3,
                    :tle4,
                    :student_id,
                    :school_year)
    end

end
