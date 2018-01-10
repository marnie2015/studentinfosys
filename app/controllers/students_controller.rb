class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_filter :admin_access_only, except: [:show, :index]
  before_filter :check_access

  # GET /students
  # GET /students.json
  def index
    if session[:user]["access"] == 1
      @students = Student.index_fields.paginate(:page => params[:page], :per_page => 20)
      if params[:txt_search]
          @students = Student.index_fields.where("students.fname ilike ? or students.lname ilike ?", "#{params[:txt_search]}%", "#{params[:txt_search]}%").paginate(:page => params[:page], :per_page => 20) if params[:searchby] == "fname"
      end
    elsif session[:user]["access"] == 2
      @students = Student.index_fields.paginate(:page => params[:page], :per_page => 20)
      if params[:txt_search]
          @students = Student.index_fields.where("students.fname ilike ? or students.lname ilike ?", "#{params[:txt_search]}%", "#{params[:txt_search]}%").paginate(:page => params[:page], :per_page => 20) if params[:searchby] == "fname"
      end
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student_year_section = StudentYearSection.where(student_id: @student.id).first
    @user = User.where(id: @student.user_id).first
  end

  # GET /students/new
  def new
    @student = Student.new
    @user = User.new
    autogenerate_id
  end

  # GET /students/1/edit
  def edit
    @student_year_section = StudentYearSection.where(student_id: @student.id).first
    @user = User.where(id: @student.user_id).first
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    @user = User.new(user_params)
    respond_to do |format|
      @user.save
      if @student.save
        @student.update(user_id: @user.id)
        StudentYearSection.create(student_id: @student.id, year_level_id: params[:year_level][:id], section_id: params[:section][:id])
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        StudentYearSection.where(student_id: @student.id).first.update(year_level_id: params[:year_level][:id], section_id: params[:section][:id])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def autogenerate_id
    year_now = Time.now.year.to_s
    get_last_student_id = Student.where("student_id ilike ?", year_now + "-AS-%").count + 1
    @student_id = year_now + "-AS-" + get_last_student_id.to_s.rjust(4, '0')
  end

  def get_sections
    render :inline => '<%= options_from_collection_for_select(Section.where(:year_level_id => ' + params[:grade] + '), :id, :description) %>'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:fname, :mname, :lname, :birthdate, :gender, :address, :birthplace, :religion, :status, :student_id, 
      :father_name, :father_birthdate, :father_address, :father_occupation, :father_contact, 
      :mother_name, :mother_birthdate, :mother_address, :mother_occupation, :mother_contact)
    end

    def user_params
      params.require(:user).permit(:user_name, :user_pass, :access, :status)
    end
end
