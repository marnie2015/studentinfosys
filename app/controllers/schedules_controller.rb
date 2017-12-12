class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:edit, :update, :destroy]
  before_filter :admin_access_only, only: [:index, :new]
  before_filter :check_access

  # GET /schedules
  # GET /schedules.json
  def index
    #@schedules = Schedule.paginate(:page => params[:page], :per_page => 20)
    @teachers = Teacher.index_fields.paginate(:page => params[:page], :per_page => 20)
    if params[:txt_search]
        @teachers = Teacher.index_fields.where("teachers.first_name ilike ?", "#{params[:txt_search]}%").paginate(:page => params[:page], :per_page => 20) if params[:searchby] == "fname"
        @teachers = Teacher.index_fields.where("teachers.last_name ilike ?", "#{params[:txt_search]}%").paginate(:page => params[:page], :per_page => 20) if params[:searchby] == "lname"
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    sy = Time.now.year.to_s + "-" + (Time.now + 1.year).year.to_s
    if params[:school_year]
      sy = params[:school_year]
    end

    @sched1 = Schedule.where(:teacher_id => params[:id], :description => "flag ceremony", :school_year => sy).select("schedules.schedule_time")
    @sched2 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :description => "2", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec")
    @sched3 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :description => "3", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec")
    @sched4 = Schedule.where(:teacher_id => params[:id], :description => "recess", :school_year => sy).select("schedules.schedule_time")
    @sched5 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :description => "5", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec")
    @sched6 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :description => "6", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec")
    @sched7 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :description => "7", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec")
    @sched8 = Schedule.where(:teacher_id => params[:id], :description => "lunch break", :school_year => sy).select("schedules.schedule_time")
    @sched9 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :description => "9", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec")
    @sched10 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :description => "10", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec")
    @sched11 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :description => "11", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec")
    @sched12 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :description => "12", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec")
    @sched13 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :description => "13", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec")
    
  
    @teacher = Teacher.joins(:position, :subject, :room).
    select("teachers.id, teachers.first_name,
            teachers.last_name,
            positions.description pos,
            subjects.description sub,
            rooms.description rm").find(params[:id])
  end

  def student_show
    sy = Time.now.year.to_s + "-" + (Time.now + 1.year).year.to_s
    if params[:school_year]
      sy = params[:school_year]
    end

    @sched1 = Schedule.where(:description => "flag ceremony", :school_year => sy).select("schedules.schedule_time")
    @sched2 = Schedule.joins(:year_level, :section, :teacher => [:position, :subject, :room]).where(:year_level_id => params[:year_level_id], :section_id => params[:section_id], :description => "2", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec, subjects.description subject, rooms.description room")
    @sched3 = Schedule.joins(:year_level, :section, :teacher => [:position, :subject, :room]).where(:year_level_id => params[:year_level_id], :section_id => params[:section_id], :description => "3", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec, subjects.description subject, rooms.description room")
    @sched4 = Schedule.joins(:year_level, :section, :teacher => [:position, :subject, :room]).where(:year_level_id => params[:year_level_id], :section_id => params[:section_id], :description => "recess", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec, subjects.description subject, rooms.description room")
    @sched5 = Schedule.joins(:year_level, :section, :teacher => [:position, :subject, :room]).where(:year_level_id => params[:year_level_id], :section_id => params[:section_id], :description => "5", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec, subjects.description subject, rooms.description room")
    @sched6 = Schedule.joins(:year_level, :section, :teacher => [:position, :subject, :room]).where(:year_level_id => params[:year_level_id], :section_id => params[:section_id], :description => "6", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec, subjects.description subject, rooms.description room")
    @sched7 = Schedule.joins(:year_level, :section, :teacher => [:position, :subject, :room]).where(:year_level_id => params[:year_level_id], :section_id => params[:section_id], :description => "7", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec, subjects.description subject, rooms.description room")
    @sched8 = Schedule.joins(:year_level, :section, :teacher => [:position, :subject, :room]).where(:year_level_id => params[:year_level_id], :section_id => params[:section_id], :description => "flag ceremony", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec, subjects.description subject, rooms.description room")
    @sched9 = Schedule.joins(:year_level, :section, :teacher => [:position, :subject, :room]).where(:year_level_id => params[:year_level_id], :section_id => params[:section_id], :description => "9", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec, subjects.description subject, rooms.description room")
    @sched10 = Schedule.joins(:year_level, :section, :teacher => [:position, :subject, :room]).where(:year_level_id => params[:year_level_id], :section_id => params[:section_id], :description => "10", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec, subjects.description subject, rooms.description room")
    @sched11 = Schedule.joins(:year_level, :section, :teacher => [:position, :subject, :room]).where(:year_level_id => params[:year_level_id], :section_id => params[:section_id], :description => "11", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec, subjects.description subject, rooms.description room")
    @sched12 = Schedule.joins(:year_level, :section, :teacher => [:position, :subject, :room]).where(:year_level_id => params[:year_level_id], :section_id => params[:section_id], :description => "12", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec, subjects.description subject, rooms.description room")
    @sched13 = Schedule.joins(:year_level, :section, :teacher => [:position, :subject, :room]).where(:year_level_id => params[:year_level_id], :section_id => params[:section_id], :description => "13", :school_year => sy).select("schedules.schedule_time, year_levels.description grade, sections.description sec, subjects.description subject, rooms.description room")
  end
  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    #asdf
    @monday1 = Schedule.new(monday1_params) #flag ceremony
    @monday2 = Schedule.new(monday2_params)
    @monday3 = Schedule.new(monday3_params)
    @monday4 = Schedule.new(monday4_params)
    @monday5 = Schedule.new(monday5_params)
    @monday6 = Schedule.new(monday6_params)
    @monday7 = Schedule.new(monday7_params)
    @monday8 = Schedule.new(monday8_params) #lunch break
    @monday9 = Schedule.new(monday9_params)
    @monday10 = Schedule.new(monday10_params)
    @monday11 = Schedule.new(monday11_params)
    @monday12 = Schedule.new(monday12_params)
    @monday13 = Schedule.new(monday13_params)

    @tuesday1 = Schedule.new(tuesday1_params) #flag ceremony
    @tuesday2 = Schedule.new(tuesday2_params)
    @tuesday3 = Schedule.new(tuesday3_params)
    @tuesday4 = Schedule.new(tuesday4_params)
    @tuesday5 = Schedule.new(tuesday5_params)
    @tuesday6 = Schedule.new(tuesday6_params)
    @tuesday7 = Schedule.new(tuesday7_params)
    @tuesday8 = Schedule.new(tuesday8_params) #lunch break
    @tuesday9 = Schedule.new(tuesday9_params)
    @tuesday10 = Schedule.new(tuesday10_params)
    @tuesday11 = Schedule.new(tuesday11_params)
    @tuesday12 = Schedule.new(tuesday12_params)
    @tuesday13 = Schedule.new(tuesday13_params)

    @wednesday1 = Schedule.new(wednesday1_params) #flag ceremony
    @wednesday2 = Schedule.new(wednesday2_params)
    @wednesday3 = Schedule.new(wednesday3_params)
    @wednesday4 = Schedule.new(wednesday4_params)
    @wednesday5 = Schedule.new(wednesday5_params)
    @wednesday6 = Schedule.new(wednesday6_params)
    @wednesday7 = Schedule.new(wednesday7_params)
    @wednesday8 = Schedule.new(wednesday8_params) #lunch break
    @wednesday9 = Schedule.new(wednesday9_params)
    @wednesday10 = Schedule.new(wednesday10_params)
    @wednesday11 = Schedule.new(wednesday11_params)
    @wednesday12 = Schedule.new(wednesday12_params)
    @wednesday13 = Schedule.new(wednesday13_params)

    @thursday1 = Schedule.new(thursday1_params)
    @thursday2 = Schedule.new(thursday2_params)
    @thursday3 = Schedule.new(thursday3_params)
    @thursday4 = Schedule.new(thursday4_params)
    @thursday5 = Schedule.new(thursday5_params)
    @thursday6 = Schedule.new(thursday6_params)
    @thursday7 = Schedule.new(thursday7_params)
    @thursday8 = Schedule.new(thursday8_params)
    @thursday9 = Schedule.new(thursday9_params)
    @thursday10 = Schedule.new(thursday10_params)
    @thursday11 = Schedule.new(thursday11_params)
    @thursday12 = Schedule.new(thursday12_params)
    @thursday13 = Schedule.new(thursday13_params)

    @friday1 = Schedule.new(friday1_params)
    @friday2 = Schedule.new(friday2_params)
    @friday3 = Schedule.new(friday3_params)
    @friday4 = Schedule.new(friday4_params)
    @friday5 = Schedule.new(friday5_params)
    @friday6 = Schedule.new(friday6_params)
    @friday7 = Schedule.new(friday7_params)
    @friday8 = Schedule.new(friday8_params)
    @friday9 = Schedule.new(friday9_params)
    @friday10 = Schedule.new(friday10_params)
    @friday11 = Schedule.new(friday11_params)
    @friday12 = Schedule.new(friday12_params)
    @friday13 = Schedule.new(friday13_params)


    
      sy = Schedule.where(:school_year => params[:schedule][:school_year], :teacher_id => params[:teacher][:id])
      if sy.count > 0
        redirect_to "/schedules/new", notice: "Error: Teacher already have a schedule for this school year"
      else
        respond_to do |format|
          if @monday1.save && @monday8.save && 
            @monday2.save && @monday3.save &&
            @monday4.save && @monday5.save &&
            @monday6.save && @monday7.save &&
            @monday9.save && @monday10.save &&
            @monday11.save && @monday12.save &&
            @monday13.save && 

            @tuesday1.save && @tuesday8.save &&
            @tuesday2.save && @tuesday3.save &&
            @tuesday4.save && @tuesday5.save &&
            @tuesday6.save && @tuesday7.save &&
            @tuesday9.save && @tuesday10.save &&
            @tuesday11.save && @tuesday12.save &&
            @tuesday13.save &&

            @wednesday1.save && @wednesday8.save &&
            @wednesday2.save && @wednesday3.save &&
            @wednesday4.save && @wednesday5.save &&
            @wednesday6.save && @wednesday7.save &&
            @wednesday9.save && @wednesday10.save &&
            @wednesday11.save && @wednesday12.save &&
            @wednesday13.save && 

            @thursday1.save && @thursday8.save &&
            @thursday2.save && @thursday3.save &&
            @thursday4.save && @thursday5.save &&
            @thursday6.save && @thursday7.save &&
            @thursday9.save && @thursday10.save &&
            @thursday11.save && @thursday12.save &&
            @thursday13.save && 

            @friday1.save && @friday8.save &&
            @friday2.save && @friday3.save &&
            @friday4.save && @friday5.save &&
            @friday6.save && @friday7.save &&
            @friday9.save && @friday10.save &&
            @friday11.save && @friday12.save &&
            @friday13.save
            format.html { redirect_to "/schedules", notice: 'Schedule was successfully created.' }
            format.json { render :show, status: :created, location: @schedule }
          else
            format.html { render :new }
            format.json { render json: @schedule.errors, status: :unprocessable_entity }
          end # end of if
        end #end of respond_to
    end #end of if
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monday1_params
      params[:school_year] = params[:schedule][:school_year]
      params[:schedule_day] = "monday"
      params[:schedule_time] = params[:time1_start] + " - " + params[:time1_end]
      params[:teacher_id] = params[:teacher][:id]
      params[:description] = "flag ceremony"
      params.permit(:school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday2_params
      params[:monday2][:school_year] = params[:schedule][:school_year]
      params[:monday2][:schedule_day] = "monday"
      params[:monday2][:schedule_time] = params[:time2_start] + " - " + params[:time2_end]
      params[:monday2][:teacher_id] = params[:teacher][:id]
      params[:monday2][:description] = "2"
      params.require(:monday2).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday3_params
      params[:monday3][:school_year] = params[:schedule][:school_year]
      params[:monday3][:schedule_day] = "monday"
      params[:monday3][:schedule_time] = params[:time3_start] + " - " + params[:time3_end]
      params[:monday3][:teacher_id] = params[:teacher][:id]
      params[:monday3][:description] = "3"
      params.require(:monday3).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday4_params
      params[:school_year] = params[:schedule][:school_year]
      params[:schedule_day] = "monday"
      params[:schedule_time] = params[:time4_start] + " - " + params[:time4_end]
      params[:teacher_id] = params[:teacher][:id]
      params[:description] = "recess"
      params.permit(:school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday5_params
      params[:monday5][:school_year] = params[:schedule][:school_year]
      params[:monday5][:schedule_day] = "monday"
      params[:monday5][:schedule_time] = params[:time5_start] + " - " + params[:time5_end]
      params[:monday5][:teacher_id] = params[:teacher][:id]
      params[:monday5][:description] = "5"
      params.require(:monday5).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday6_params
      params[:monday6][:school_year] = params[:schedule][:school_year]
      params[:monday6][:schedule_day] = "monday"
      params[:monday6][:schedule_time] = params[:time6_start] + " - " + params[:time6_end]
      params[:monday6][:teacher_id] = params[:teacher][:id]
      params[:monday6][:description] = "6"
      params.require(:monday6).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday7_params
      params[:monday7][:school_year] = params[:schedule][:school_year]
      params[:monday7][:schedule_day] = "monday"
      params[:monday7][:schedule_time] = params[:time7_start] + " - " + params[:time7_end]
      params[:monday7][:teacher_id] = params[:teacher][:id]
      params[:monday7][:description] = "7"
      params.require(:monday7).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday8_params
      params[:school_year] = params[:schedule][:school_year]
      params[:schedule_day] = "monday"
      params[:schedule_time] = params[:time8_start] + " - " + params[:time8_end]
      params[:teacher_id] = params[:teacher][:id]
      params[:description] = "lunch break"
      params.permit(:school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday9_params
      params[:monday9][:school_year] = params[:schedule][:school_year]
      params[:monday9][:schedule_day] = "monday"
      params[:monday9][:schedule_time] = params[:time9_start] + " - " + params[:time9_end]
      params[:monday9][:teacher_id] = params[:teacher][:id]
      params[:monday9][:description] = "9"
      params.require(:monday9).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday10_params
      params[:monday10][:school_year] = params[:schedule][:school_year]
      params[:monday10][:schedule_day] = "monday"
      params[:monday10][:schedule_time] = params[:time10_start] + " - " + params[:time10_end]
      params[:monday10][:teacher_id] = params[:teacher][:id]
      params[:monday10][:description] = "10"
      params.require(:monday10).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday11_params
      params[:monday11][:school_year] = params[:schedule][:school_year]
      params[:monday11][:schedule_day] = "monday"
      params[:monday11][:schedule_time] = params[:time11_start] + " - " + params[:time11_end]
      params[:monday11][:teacher_id] = params[:teacher][:id]
      params[:monday11][:description] = "11"
      params.require(:monday11).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday12_params
      params[:monday12][:school_year] = params[:schedule][:school_year]
      params[:monday12][:schedule_day] = "monday"
      params[:monday12][:schedule_time] = params[:time12_start] + " - " + params[:time12_end]
      params[:monday12][:teacher_id] = params[:teacher][:id]
      params[:monday12][:description] = "12"
      params.require(:monday12).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday13_params
      params[:monday13][:school_year] = params[:schedule][:school_year]
      params[:monday13][:schedule_day] = "monday"
      params[:monday13][:schedule_time] = params[:time13_start] + " - " + params[:time13_end]
      params[:monday13][:teacher_id] = params[:teacher][:id]
      params[:monday13][:description] = "13"
      params.require(:monday13).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    

    #tuesday
    def tuesday1_params
      params[:school_year] = params[:schedule][:school_year]
      params[:schedule_day] = "tuesday"
      params[:schedule_time] = params[:time1_start] + " - " + params[:time1_end]
      params[:teacher_id] = params[:teacher][:id]
      params[:description] = "flag ceremony"
      params.permit(:school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday2_params
      params[:tuesday2][:school_year] = params[:schedule][:school_year]
      params[:tuesday2][:schedule_day] = "tuesday"
      params[:tuesday2][:schedule_time] = params[:time2_start] + " - " + params[:time2_end]
      params[:tuesday2][:teacher_id] = params[:teacher][:id]
      params[:tuesday2][:description] = "2"
      params.require(:tuesday2).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday3_params
      params[:tuesday3][:school_year] = params[:schedule][:school_year]
      params[:tuesday3][:schedule_day] = "tuesday"
      params[:tuesday3][:schedule_time] = params[:time3_start] + " - " + params[:time3_end]
      params[:tuesday3][:teacher_id] = params[:teacher][:id]
      params[:tuesday3][:description] = "3"
      params.require(:tuesday3).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday4_params
      params[:school_year] = params[:schedule][:school_year]
      params[:schedule_day] = "tuesday"
      params[:schedule_time] = params[:time4_start] + " - " + params[:time4_end]
      params[:teacher_id] = params[:teacher][:id]
      params[:description] = "recess"
      params.permit(:school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday5_params
      params[:tuesday5][:school_year] = params[:schedule][:school_year]
      params[:tuesday5][:schedule_day] = "tuesday"
      params[:tuesday5][:schedule_time] = params[:time5_start] + " - " + params[:time5_end]
      params[:tuesday5][:teacher_id] = params[:teacher][:id]
      params[:tuesday5][:description] = "5"
      params.require(:tuesday5).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday6_params
      params[:tuesday6][:school_year] = params[:schedule][:school_year]
      params[:tuesday6][:schedule_day] = "tuesday"
      params[:tuesday6][:schedule_time] = params[:time6_start] + " - " + params[:time6_end]
      params[:tuesday6][:teacher_id] = params[:teacher][:id]
      params[:tuesday6][:description] = "6"
      params.require(:tuesday6).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday7_params
      params[:tuesday7][:school_year] = params[:schedule][:school_year]
      params[:tuesday7][:schedule_day] = "tuesday"
      params[:tuesday7][:schedule_time] = params[:time7_start] + " - " + params[:time7_end]
      params[:tuesday7][:teacher_id] = params[:teacher][:id]
      params[:tuesday7][:description] = "7"
      params.require(:tuesday7).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday8_params
      params[:school_year] = params[:schedule][:school_year]
      params[:schedule_day] = "tuesday"
      params[:schedule_time] = params[:time8_start] + " - " + params[:time8_end]
      params[:teacher_id] = params[:teacher][:id]
      params[:description] = "lunch break"
      params.permit(:school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday9_params
      params[:tuesday9][:school_year] = params[:schedule][:school_year]
      params[:tuesday9][:schedule_day] = "tuesday"
      params[:tuesday9][:schedule_time] = params[:time9_start] + " - " + params[:time9_end]
      params[:tuesday9][:teacher_id] = params[:teacher][:id]
      params[:tuesday9][:description] = "9"
      params.require(:tuesday9).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday10_params
      params[:tuesday10][:school_year] = params[:schedule][:school_year]
      params[:tuesday10][:schedule_day] = "tuesday"
      params[:tuesday10][:schedule_time] = params[:time10_start] + " - " + params[:time10_end]
      params[:tuesday10][:teacher_id] = params[:teacher][:id]
      params[:tuesday10][:description] = "10"
      params.require(:tuesday10).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday11_params
      params[:tuesday11][:school_year] = params[:schedule][:school_year]
      params[:tuesday11][:schedule_day] = "tuesday"
      params[:tuesday11][:schedule_time] = params[:time11_start] + " - " + params[:time11_end]
      params[:tuesday11][:teacher_id] = params[:teacher][:id]
      params[:tuesday11][:description] = "11"
      params.require(:tuesday11).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday12_params
      params[:tuesday12][:school_year] = params[:schedule][:school_year]
      params[:tuesday12][:schedule_day] = "tuesday"
      params[:tuesday12][:schedule_time] = params[:time12_start] + " - " + params[:time12_end]
      params[:tuesday12][:teacher_id] = params[:teacher][:id]
      params[:tuesday12][:description] = "12"
      params.require(:tuesday12).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday13_params
      params[:tuesday13][:school_year] = params[:schedule][:school_year]
      params[:tuesday13][:schedule_day] = "tuesday"
      params[:tuesday13][:schedule_time] = params[:time13_start] + " - " + params[:time13_end]
      params[:tuesday13][:teacher_id] = params[:teacher][:id]
      params[:tuesday13][:description] = "13"
      params.require(:tuesday13).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    #wednesday
    def wednesday1_params
      params[:school_year] = params[:schedule][:school_year]
      params[:schedule_day] = "wednesday"
      params[:schedule_time] = params[:time1_start] + " - " + params[:time1_end]
      params[:teacher_id] = params[:teacher][:id]
      params[:description] = "flag ceremony"
      params.permit(:school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday2_params
      params[:wednesday2][:school_year] = params[:schedule][:school_year]
      params[:wednesday2][:schedule_day] = "wednesday"
      params[:wednesday2][:schedule_time] = params[:time2_start] + " - " + params[:time2_end]
      params[:wednesday2][:teacher_id] = params[:teacher][:id]
      params[:wednesday2][:description] = "2"
      params.require(:wednesday2).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday3_params
      params[:wednesday3][:school_year] = params[:schedule][:school_year]
      params[:wednesday3][:schedule_day] = "wednesday"
      params[:wednesday3][:schedule_time] = params[:time3_start] + " - " + params[:time3_end]
      params[:wednesday3][:teacher_id] = params[:teacher][:id]
      params[:wednesday3][:description] = "3"
      params.require(:wednesday3).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday4_params
      params[:school_year] = params[:schedule][:school_year]
      params[:schedule_day] = "wednesday"
      params[:schedule_time] = params[:time4_start] + " - " + params[:time4_end]
      params[:teacher_id] = params[:teacher][:id]
      params[:description] = "recess"
      params.permit(:school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday5_params
      params[:wednesday5][:school_year] = params[:schedule][:school_year]
      params[:wednesday5][:schedule_day] = "wednesday"
      params[:wednesday5][:schedule_time] = params[:time5_start] + " - " + params[:time5_end]
      params[:wednesday5][:teacher_id] = params[:teacher][:id]
      params[:wednesday5][:description] = "5"
      params.require(:wednesday5).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday6_params
      params[:wednesday6][:school_year] = params[:schedule][:school_year]
      params[:wednesday6][:schedule_day] = "wednesday"
      params[:wednesday6][:schedule_time] = params[:time6_start] + " - " + params[:time6_end]
      params[:wednesday6][:teacher_id] = params[:teacher][:id]
      params[:wednesday6][:description] = "6"
      params.require(:wednesday6).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday7_params
      params[:wednesday7][:school_year] = params[:schedule][:school_year]
      params[:wednesday7][:schedule_day] = "wednesday"
      params[:wednesday7][:schedule_time] = params[:time7_start] + " - " + params[:time7_end]
      params[:wednesday7][:teacher_id] = params[:teacher][:id]
      params[:wednesday7][:description] = "7"
      params.require(:wednesday7).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday8_params
      params[:school_year] = params[:schedule][:school_year]
      params[:schedule_day] = "wednesday"
      params[:schedule_time] = params[:time8_start] + " - " + params[:time8_end]
      params[:teacher_id] = params[:teacher][:id]
      params[:description] = "lunch break"
      params.permit(:school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday9_params
      params[:wednesday9][:school_year] = params[:schedule][:school_year]
      params[:wednesday9][:schedule_day] = "wednesday"
      params[:wednesday9][:schedule_time] = params[:time9_start] + " - " + params[:time9_end]
      params[:wednesday9][:teacher_id] = params[:teacher][:id]
      params[:wednesday9][:description] = "9"
      params.require(:wednesday9).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday10_params
      params[:wednesday10][:school_year] = params[:schedule][:school_year]
      params[:wednesday10][:schedule_day] = "wednesday"
      params[:wednesday10][:schedule_time] = params[:time10_start] + " - " + params[:time10_end]
      params[:wednesday10][:teacher_id] = params[:teacher][:id]
      params[:wednesday10][:description] = "10"
      params.require(:wednesday10).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday11_params
      params[:wednesday11][:school_year] = params[:schedule][:school_year]
      params[:wednesday11][:schedule_day] = "wednesday"
      params[:wednesday11][:schedule_time] = params[:time11_start] + " - " + params[:time11_end]
      params[:wednesday11][:teacher_id] = params[:teacher][:id]
      params[:wednesday11][:description] = "11"
      params.require(:wednesday11).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday12_params
      params[:wednesday12][:school_year] = params[:schedule][:school_year]
      params[:wednesday12][:schedule_day] = "wednesday"
      params[:wednesday12][:schedule_time] = params[:time12_start] + " - " + params[:time12_end]
      params[:wednesday12][:teacher_id] = params[:teacher][:id]
      params[:wednesday12][:description] = "12"
      params.require(:wednesday12).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday13_params
      params[:wednesday13][:school_year] = params[:schedule][:school_year]
      params[:wednesday13][:schedule_day] = "wednesday"
      params[:wednesday13][:schedule_time] = params[:time13_start] + " - " + params[:time13_end]
      params[:wednesday13][:teacher_id] = params[:teacher][:id]
      params[:wednesday13][:description] = "13"
      params.require(:wednesday13).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    #thursday
    def thursday1_params
      params[:school_year] = params[:schedule][:school_year]
      params[:schedule_day] = "thursday"
      params[:schedule_time] = params[:time1_start] + " - " + params[:time1_end]
      params[:teacher_id] = params[:teacher][:id]
      params[:description] = "flag ceremony"
      params.permit(:school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday2_params
      params[:thursday2][:school_year] = params[:schedule][:school_year]
      params[:thursday2][:schedule_day] = "thursday"
      params[:thursday2][:schedule_time] = params[:time2_start] + " - " + params[:time2_end]
      params[:thursday2][:teacher_id] = params[:teacher][:id]
      params[:thursday2][:description] = "2"
      params.require(:thursday2).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday3_params
      params[:thursday3][:school_year] = params[:schedule][:school_year]
      params[:thursday3][:schedule_day] = "thursday"
      params[:thursday3][:schedule_time] = params[:time3_start] + " - " + params[:time3_end]
      params[:thursday3][:teacher_id] = params[:teacher][:id]
      params[:thursday3][:description] = "3"
      params.require(:thursday3).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday4_params
      params[:school_year] = params[:schedule][:school_year]
      params[:schedule_day] = "thursday"
      params[:schedule_time] = params[:time4_start] + " - " + params[:time4_end]
      params[:teacher_id] = params[:teacher][:id]
      params[:description] = "recess"
      params.permit(:school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday5_params
      params[:thursday5][:school_year] = params[:schedule][:school_year]
      params[:thursday5][:schedule_day] = "thursday"
      params[:thursday5][:schedule_time] = params[:time5_start] + " - " + params[:time5_end]
      params[:thursday5][:teacher_id] = params[:teacher][:id]
      params[:thursday5][:description] = "5"
      params.require(:thursday5).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday6_params
      params[:thursday6][:school_year] = params[:schedule][:school_year]
      params[:thursday6][:schedule_day] = "thursday"
      params[:thursday6][:schedule_time] = params[:time6_start] + " - " + params[:time6_end]
      params[:thursday6][:teacher_id] = params[:teacher][:id]
      params[:thursday6][:description] = "6"
      params.require(:thursday6).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday7_params
      params[:thursday7][:school_year] = params[:schedule][:school_year]
      params[:thursday7][:schedule_day] = "thursday"
      params[:thursday7][:schedule_time] = params[:time7_start] + " - " + params[:time7_end]
      params[:thursday7][:teacher_id] = params[:teacher][:id]
      params[:thursday7][:description] = "7"
      params.require(:thursday7).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday8_params
      params[:school_year] = params[:schedule][:school_year]
      params[:schedule_day] = "thursday"
      params[:schedule_time] = params[:time8_start] + " - " + params[:time8_end]
      params[:teacher_id] = params[:teacher][:id]
      params[:description] = "lunch break"
      params.permit(:school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday9_params
      params[:thursday9][:school_year] = params[:schedule][:school_year]
      params[:thursday9][:schedule_day] = "thursday"
      params[:thursday9][:schedule_time] = params[:time9_start] + " - " + params[:time9_end]
      params[:thursday9][:teacher_id] = params[:teacher][:id]
      params[:thursday9][:description] = "9"
      params.require(:thursday9).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday10_params
      params[:thursday10][:school_year] = params[:schedule][:school_year]
      params[:thursday10][:schedule_day] = "thursday"
      params[:thursday10][:schedule_time] = params[:time10_start] + " - " + params[:time10_end]
      params[:thursday10][:teacher_id] = params[:teacher][:id]
      params[:thursday10][:description] = "10"
      params.require(:thursday10).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday11_params
      params[:thursday11][:school_year] = params[:schedule][:school_year]
      params[:thursday11][:schedule_day] = "thursday"
      params[:thursday11][:schedule_time] = params[:time11_start] + " - " + params[:time11_end]
      params[:thursday11][:teacher_id] = params[:teacher][:id]
      params[:thursday11][:description] = "11"
      params.require(:thursday11).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday12_params
      params[:thursday12][:school_year] = params[:schedule][:school_year]
      params[:thursday12][:schedule_day] = "thursday"
      params[:thursday12][:schedule_time] = params[:time12_start] + " - " + params[:time12_end]
      params[:thursday12][:teacher_id] = params[:teacher][:id]
      params[:thursday12][:description] = "12"
      params.require(:thursday12).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday13_params
      params[:thursday13][:school_year] = params[:schedule][:school_year]
      params[:thursday13][:schedule_day] = "thursday"
      params[:thursday13][:schedule_time] = params[:time13_start] + " - " + params[:time13_end]
      params[:thursday13][:teacher_id] = params[:teacher][:id]
      params[:thursday13][:description] = "13"
      params.require(:thursday13).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    #friday
    def friday1_params
      params[:school_year] = params[:schedule][:school_year]
      params[:schedule_day] = "friday"
      params[:schedule_time] = params[:time1_start] + " - " + params[:time1_end]
      params[:teacher_id] = params[:teacher][:id]
      params[:description] = "flag ceremony"
      params.permit(:school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday2_params
      params[:friday2][:school_year] = params[:schedule][:school_year]
      params[:friday2][:schedule_day] = "friday"
      params[:friday2][:schedule_time] = params[:time2_start] + " - " + params[:time2_end]
      params[:friday2][:teacher_id] = params[:teacher][:id]
      params[:friday2][:description] = "2"
      params.require(:friday2).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end
  
    def friday3_params
      params[:friday3][:school_year] = params[:schedule][:school_year]
      params[:friday3][:schedule_day] = "friday"
      params[:friday3][:schedule_time] = params[:time3_start] + " - " + params[:time3_end]
      params[:friday3][:teacher_id] = params[:teacher][:id]
      params[:friday3][:description] = "3"
      params.require(:friday3).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday4_params
      params[:school_year] = params[:schedule][:school_year]
      params[:schedule_day] = "friday"
      params[:schedule_time] = params[:time4_start] + " - " + params[:time4_end]
      params[:teacher_id] = params[:teacher][:id]
      params[:description] = "recess"
      params.permit(:school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday5_params
      params[:friday5][:school_year] = params[:schedule][:school_year]
      params[:friday5][:schedule_day] = "friday"
      params[:friday5][:schedule_time] = params[:time5_start] + " - " + params[:time5_end]
      params[:friday5][:teacher_id] = params[:teacher][:id]
      params[:friday5][:description] = "5"
      params.require(:friday5).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday6_params
      params[:friday6][:school_year] = params[:schedule][:school_year]
      params[:friday6][:schedule_day] = "friday"
      params[:friday6][:schedule_time] = params[:time6_start] + " - " + params[:time6_end]
      params[:friday6][:teacher_id] = params[:teacher][:id]
      params[:friday6][:description] = "6"
      params.require(:friday6).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday7_params
      params[:friday7][:school_year] = params[:schedule][:school_year]
      params[:friday7][:schedule_day] = "friday"
      params[:friday7][:schedule_time] = params[:time7_start] + " - " + params[:time7_end]
      params[:friday7][:teacher_id] = params[:teacher][:id]
      params[:friday7][:description] = "7"
      params.require(:friday7).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday8_params
      params[:school_year] = params[:schedule][:school_year]
      params[:schedule_day] = "friday"
      params[:schedule_time] = params[:time8_start] + " - " + params[:time8_end]
      params[:teacher_id] = params[:teacher][:id]
      params[:description] = "lunch break"
      params.permit(:school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday9_params
      params[:friday9][:school_year] = params[:schedule][:school_year]
      params[:friday9][:schedule_day] = "friday"
      params[:friday9][:schedule_time] = params[:time9_start] + " - " + params[:time9_end]
      params[:friday9][:teacher_id] = params[:teacher][:id]
      params[:friday9][:description] = "9"
      params.require(:friday9).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday10_params
      params[:friday10][:school_year] = params[:schedule][:school_year]
      params[:friday10][:schedule_day] = "friday"
      params[:friday10][:schedule_time] = params[:time10_start] + " - " + params[:time10_end]
      params[:friday10][:teacher_id] = params[:teacher][:id]
      params[:friday10][:description] = "10"
      params.require(:friday10).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday11_params
      params[:friday11][:school_year] = params[:schedule][:school_year]
      params[:friday11][:schedule_day] = "friday"
      params[:friday11][:schedule_time] = params[:time11_start] + " - " + params[:time11_end]
      params[:friday11][:teacher_id] = params[:teacher][:id]
      params[:friday11][:description] = "11"
      params.require(:friday11).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday12_params
      params[:friday12][:school_year] = params[:schedule][:school_year]
      params[:friday12][:schedule_day] = "friday"
      params[:friday12][:schedule_time] = params[:time12_start] + " - " + params[:time12_end]
      params[:friday12][:teacher_id] = params[:teacher][:id]
      params[:friday12][:description] = "12"
      params.require(:friday12).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday13_params
      params[:friday13][:school_year] = params[:schedule][:school_year]
      params[:friday13][:schedule_day] = "friday"
      params[:friday13][:schedule_time] = params[:time13_start] + " - " + params[:time13_end]
      params[:friday13][:teacher_id] = params[:teacher][:id]
      params[:friday13][:description] = "13"
      params.require(:friday13).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

end
