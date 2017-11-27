class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.index_fields.paginate(:page => params[:page], :per_page => 20)
    if params[:txt_search]
        @teachers = Teacher.index_fields.where("teachers.first_name ilike ?", "#{params[:txt_search]}%").paginate(:page => params[:page], :per_page => 20) if params[:searchby] == "fname"
        @teachers = Teacher.index_fields.where("teachers.last_name ilike ?", "#{params[:txt_search]}%").paginate(:page => params[:page], :per_page => 20) if params[:searchby] == "lname"
    end
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
    @user = User.new
    autogenerate_id
  end

  # GET /teachers/1/edit
  def edit
    @user = User.find(@teacher.user_id)
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)
    @user = User.new(:user_name => params[:user_name], :user_pass => params[:user_pass], :status => 'Active', :access => 2)

    respond_to do |format|
      if @user.save
        @teacher.user_id = @user.id
        @teacher.save
        format.html { redirect_to "/teachers", notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to "/teachers", notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def autogenerate_id
    year_now = Time.now.year.to_s
    get_last_teacher_id = Teacher.where("teacherid ilike ?", year_now + "ASF%").count + 1
    @teacher_id = year_now + "ASF" + get_last_teacher_id.to_s.rjust(4, '0')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :position_id, :user_id, :subject_id, :room_id, :teacherid)
    end
end
