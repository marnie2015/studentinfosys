class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.paginate(:page => params[:page], :per_page => 20)
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student_year_section = StudentYearSection.where(student_id: @student.id).first
  end

  # GET /students/new
  def new
    @student = Student.new
    autogenerate_id
  end

  # GET /students/1/edit
  def edit
    @student_year_section = StudentYearSection.where(student_id: @student.id).first
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:fname, :mname, :lname, :birthdate, :gender, :address_1, :address_2, :contact_1, :contact_2, :user_name, :user_pass, :status, :student_id)
    end
end
