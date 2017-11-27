class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:edit, :update, :destroy]
  before_filter :admin_access_only, only: [:index, :new]

  # GET /schedules
  # GET /schedules.json
  def index
    #@schedules = Schedule.paginate(:page => params[:page], :per_page => 20)
    @teachers = Teacher.joins(:position, :subject, :room).
                  select("teachers.id, teachers.first_name,
                          teachers.last_name,
                          positions.description pos,
                          subjects.description sub,
                          rooms.description rm").
                  paginate(:page => params[:page], :per_page => 20)
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    sy = Time.now.year.to_s + "-" + (Time.now + 1.year).year.to_s
    if params[:school_year]
      sy = params[:school_year]
    end

    @sched8 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :schedule_time => "8AM - 9AM", :school_year => sy).select("year_levels.description grade, sections.description sec")
    @sched9 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :schedule_time => "9AM - 10AM", :school_year => sy).select("year_levels.description grade, sections.description sec")
    @sched10 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :schedule_time => "10AM - 11AM", :school_year => sy).select("year_levels.description grade, sections.description sec")
    @sched11 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :schedule_time => "11AM - 12NN", :school_year => sy).select("year_levels.description grade, sections.description sec")

    @sched13 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :schedule_time => "1PM - 2PM", :school_year => sy).select("year_levels.description grade, sections.description sec")
    @sched14 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :schedule_time => "2PM - 3PM", :school_year => sy).select("year_levels.description grade, sections.description sec")
    @sched15 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :schedule_time => "3PM - 4PM", :school_year => sy).select("year_levels.description grade, sections.description sec")
    @sched16 = Schedule.joins(:year_level, :section).where(:teacher_id => params[:id], :schedule_time => "4PM - 5PM", :school_year => sy).select("year_levels.description grade, sections.description sec")
  
    @teacher = Teacher.joins(:position, :subject, :room).
    select("teachers.id, teachers.first_name,
            teachers.last_name,
            positions.description pos,
            subjects.description sub,
            rooms.description rm").find(params[:id])
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
    
    @monday8 = Schedule.new(monday8_params)
    @monday9 = Schedule.new(monday9_params)
    @monday10 = Schedule.new(monday10_params)
    @monday11 = Schedule.new(monday11_params)
    @monday13 = Schedule.new(monday13_params)
    @monday14 = Schedule.new(monday14_params)
    @monday15 = Schedule.new(monday15_params)
    @monday16 = Schedule.new(monday16_params)

    @tuesday8 = Schedule.new(tuesday8_params)
    @tuesday9 = Schedule.new(tuesday9_params)
    @tuesday10 = Schedule.new(tuesday10_params)
    @tuesday11 = Schedule.new(tuesday11_params)
    @tuesday13 = Schedule.new(tuesday13_params)
    @tuesday14 = Schedule.new(tuesday14_params)
    @tuesday15 = Schedule.new(tuesday15_params)
    @tuesday16 = Schedule.new(tuesday16_params)

    @wednesday8 = Schedule.new(wednesday8_params)
    @wednesday9 = Schedule.new(wednesday9_params)
    @wednesday10 = Schedule.new(wednesday10_params)
    @wednesday11 = Schedule.new(wednesday11_params)
    @wednesday13 = Schedule.new(wednesday13_params)
    @wednesday14 = Schedule.new(wednesday14_params)
    @wednesday15 = Schedule.new(wednesday15_params)
    @wednesday16 = Schedule.new(wednesday16_params)

    @thursday8 = Schedule.new(thursday8_params)
    @thursday9 = Schedule.new(thursday9_params)
    @thursday10 = Schedule.new(thursday10_params)
    @thursday11 = Schedule.new(thursday11_params)
    @thursday13 = Schedule.new(thursday13_params)
    @thursday14 = Schedule.new(thursday14_params)
    @thursday15 = Schedule.new(thursday15_params)
    @thursday16 = Schedule.new(thursday16_params)

    @friday8 = Schedule.new(friday8_params)
    @friday9 = Schedule.new(friday9_params)
    @friday10 = Schedule.new(friday10_params)
    @friday11 = Schedule.new(friday11_params)
    @friday13 = Schedule.new(friday13_params)
    @friday14 = Schedule.new(friday14_params)
    @friday15 = Schedule.new(friday15_params)
    @friday16 = Schedule.new(friday16_params)


    respond_to do |format|
      if @monday8.save && @monday9.save &&
        @monday10.save && @monday11.save &&
        @monday13.save && @monday14.save &&
        @monday15.save && @monday16.save && 

        @tuesday8.save && @tuesday9.save &&
        @tuesday10.save && @tuesday11.save &&
        @tuesday13.save && @tuesday14.save &&
        @tuesday15.save && @tuesday16.save && 

        @wednesday8.save && @wednesday9.save &&
        @wednesday10.save && @wednesday11.save &&
        @wednesday13.save && @wednesday14.save &&
        @wednesday15.save && @wednesday16.save && 

        @thursday8.save && @thursday9.save &&
        @thursday10.save && @thursday11.save &&
        @thursday13.save && @thursday14.save &&
        @thursday15.save && @thursday16.save && 

        @friday8.save && @friday9.save &&
        @friday10.save && @friday11.save &&
        @friday13.save && @friday14.save &&
        @friday15.save && @friday16.save
        format.html { redirect_to "/schedules", notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
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
    def monday8_params
      params[:monday8][:school_year] = params[:schedule][:school_year]
      params[:monday8][:schedule_day] = "monday"
      params[:monday8][:schedule_time] = "8AM - 9AM"
      params[:monday8][:teacher_id] = params[:teacher][:id]
      params.require(:monday8).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday9_params
      params[:monday9][:school_year] = params[:schedule][:school_year]
      params[:monday9][:schedule_day] = "monday"
      params[:monday9][:schedule_time] = "9AM - 10AM"
      params[:monday9][:teacher_id] = params[:teacher][:id]
      params.require(:monday9).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday10_params
      params[:monday10][:school_year] = params[:schedule][:school_year]
      params[:monday10][:schedule_day] = "monday"
      params[:monday10][:schedule_time] = "10AM - 11AM"
      params[:monday10][:teacher_id] = params[:teacher][:id]
      params.require(:monday10).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday11_params
      params[:monday11][:school_year] = params[:schedule][:school_year]
      params[:monday11][:schedule_day] = "monday"
      params[:monday11][:schedule_time] = "11AM - 12NN"
      params[:monday11][:teacher_id] = params[:teacher][:id]
      params.require(:monday11).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday13_params
      params[:monday13][:school_year] = params[:schedule][:school_year]
      params[:monday13][:schedule_day] = "monday"
      params[:monday13][:schedule_time] = "1PM - 2PM"
      params[:monday13][:teacher_id] = params[:teacher][:id]
      params.require(:monday13).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday14_params
      params[:monday14][:school_year] = params[:schedule][:school_year]
      params[:monday14][:schedule_day] = "monday"
      params[:monday14][:schedule_time] = "2PM - 3PM"
      params[:monday14][:teacher_id] = params[:teacher][:id]
      params.require(:monday14).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday15_params
      params[:monday15][:school_year] = params[:schedule][:school_year]
      params[:monday15][:schedule_day] = "monday"
      params[:monday15][:schedule_time] = "3PM - 4PM"
      params[:monday15][:teacher_id] = params[:teacher][:id]
      params.require(:monday15).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def monday16_params
      params[:monday16][:school_year] = params[:schedule][:school_year]
      params[:monday16][:schedule_day] = "monday"
      params[:monday16][:schedule_time] = "4PM - 5PM"
      params[:monday16][:teacher_id] = params[:teacher][:id]
      params.require(:monday16).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    #tuesday
    def tuesday8_params
      params[:tuesday8][:school_year] = params[:schedule][:school_year]
      params[:tuesday8][:schedule_day] = "tuesday"
      params[:tuesday8][:schedule_time] = "8AM - 9AM"
      params[:tuesday8][:teacher_id] = params[:teacher][:id]
      params.require(:tuesday8).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday9_params
      params[:tuesday9][:school_year] = params[:schedule][:school_year]
      params[:tuesday9][:schedule_day] = "tuesday"
      params[:tuesday9][:schedule_time] = "9AM - 10AM"
      params[:tuesday9][:teacher_id] = params[:teacher][:id]
      params.require(:tuesday9).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday10_params
      params[:tuesday10][:school_year] = params[:schedule][:school_year]
      params[:tuesday10][:schedule_day] = "tuesday"
      params[:tuesday10][:schedule_time] = "10AM - 11AM"
      params[:tuesday10][:teacher_id] = params[:teacher][:id]
      params.require(:tuesday10).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday11_params
      params[:tuesday11][:school_year] = params[:schedule][:school_year]
      params[:tuesday11][:schedule_day] = "tuesday"
      params[:tuesday11][:schedule_time] = "11AM - 12NN"
      params[:tuesday11][:teacher_id] = params[:teacher][:id]
      params.require(:tuesday11).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday13_params
      params[:tuesday13][:school_year] = params[:schedule][:school_year]
      params[:tuesday13][:schedule_day] = "tuesday"
      params[:tuesday13][:schedule_time] = "1PM - 2PM"
      params[:tuesday13][:teacher_id] = params[:teacher][:id]
      params.require(:tuesday13).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday14_params
      params[:tuesday14][:school_year] = params[:schedule][:school_year]
      params[:tuesday14][:schedule_day] = "tuesday"
      params[:tuesday14][:schedule_time] = "2PM - 3PM"
      params[:tuesday14][:teacher_id] = params[:teacher][:id]
      params.require(:tuesday14).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday15_params
      params[:tuesday15][:school_year] = params[:schedule][:school_year]
      params[:tuesday15][:schedule_day] = "tuesday"
      params[:tuesday15][:schedule_time] = "3PM - 4PM"
      params[:tuesday15][:teacher_id] = params[:teacher][:id]
      params.require(:tuesday15).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def tuesday16_params
      params[:tuesday16][:school_year] = params[:schedule][:school_year]
      params[:tuesday16][:schedule_day] = "tuesday"
      params[:tuesday16][:schedule_time] = "4PM - 5PM"
      params[:tuesday16][:teacher_id] = params[:teacher][:id]
      params.require(:tuesday16).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    #wednesday
    def wednesday8_params
      params[:wednesday8][:school_year] = params[:schedule][:school_year]
      params[:wednesday8][:schedule_day] = "wednesday"
      params[:wednesday8][:schedule_time] = "8AM - 9AM"
      params[:wednesday8][:teacher_id] = params[:teacher][:id]
      params.require(:wednesday8).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday9_params
      params[:wednesday9][:school_year] = params[:schedule][:school_year]
      params[:wednesday9][:schedule_day] = "wednesday"
      params[:wednesday9][:schedule_time] = "9AM - 10AM"
      params[:wednesday9][:teacher_id] = params[:teacher][:id]
      params.require(:wednesday9).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday10_params
      params[:wednesday10][:school_year] = params[:schedule][:school_year]
      params[:wednesday10][:schedule_day] = "wednesday"
      params[:wednesday10][:schedule_time] = "10AM - 11AM"
      params[:wednesday10][:teacher_id] = params[:teacher][:id]
      params.require(:wednesday10).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday11_params
      params[:wednesday11][:school_year] = params[:schedule][:school_year]
      params[:wednesday11][:schedule_day] = "wednesday"
      params[:wednesday11][:schedule_time] = "11AM - 12NN"
      params[:wednesday11][:teacher_id] = params[:teacher][:id]
      params.require(:wednesday11).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday13_params
      params[:wednesday13][:school_year] = params[:schedule][:school_year]
      params[:wednesday13][:schedule_day] = "wednesday"
      params[:wednesday13][:schedule_time] = "1PM - 2PM"
      params[:wednesday13][:teacher_id] = params[:teacher][:id]
      params.require(:wednesday13).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday14_params
      params[:wednesday14][:school_year] = params[:schedule][:school_year]
      params[:wednesday14][:schedule_day] = "wednesday"
      params[:wednesday14][:schedule_time] = "2PM - 3PM"
      params[:wednesday14][:teacher_id] = params[:teacher][:id]
      params.require(:wednesday14).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday15_params
      params[:wednesday15][:school_year] = params[:schedule][:school_year]
      params[:wednesday15][:schedule_day] = "wednesday"
      params[:wednesday15][:schedule_time] = "3PM - 4PM"
      params[:wednesday15][:teacher_id] = params[:teacher][:id]
      params.require(:wednesday15).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def wednesday16_params
      params[:wednesday16][:school_year] = params[:schedule][:school_year]
      params[:wednesday16][:schedule_day] = "wednesday"
      params[:wednesday16][:schedule_time] = "4PM - 5PM"
      params[:wednesday16][:teacher_id] = params[:teacher][:id]
      params.require(:wednesday16).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    #thursday
    def thursday8_params
      params[:thursday8][:school_year] = params[:schedule][:school_year]
      params[:thursday8][:schedule_day] = "thursday"
      params[:thursday8][:schedule_time] = "8AM - 9AM"
      params[:thursday8][:teacher_id] = params[:teacher][:id]
      params.require(:thursday8).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday9_params
      params[:thursday9][:school_year] = params[:schedule][:school_year]
      params[:thursday9][:schedule_day] = "thursday"
      params[:thursday9][:schedule_time] = "9AM - 10AM"
      params[:thursday9][:teacher_id] = params[:teacher][:id]
      params.require(:thursday9).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday10_params
      params[:thursday10][:school_year] = params[:schedule][:school_year]
      params[:thursday10][:schedule_day] = "thursday"
      params[:thursday10][:schedule_time] = "10AM - 11AM"
      params[:thursday10][:teacher_id] = params[:teacher][:id]
      params.require(:thursday10).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday11_params
      params[:thursday11][:school_year] = params[:schedule][:school_year]
      params[:thursday11][:schedule_day] = "thursday"
      params[:thursday11][:schedule_time] = "11AM - 12NN"
      params[:thursday11][:teacher_id] = params[:teacher][:id]
      params.require(:thursday11).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday13_params
      params[:thursday13][:school_year] = params[:schedule][:school_year]
      params[:thursday13][:schedule_day] = "thursday"
      params[:thursday13][:schedule_time] = "1PM - 2PM"
      params[:thursday13][:teacher_id] = params[:teacher][:id]
      params.require(:thursday13).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday14_params
      params[:thursday14][:school_year] = params[:schedule][:school_year]
      params[:thursday14][:schedule_day] = "thursday"
      params[:thursday14][:schedule_time] = "2PM - 3PM"
      params[:thursday14][:teacher_id] = params[:teacher][:id]
      params.require(:thursday14).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday15_params
      params[:thursday15][:school_year] = params[:schedule][:school_year]
      params[:thursday15][:schedule_day] = "thursday"
      params[:thursday15][:schedule_time] = "3PM - 4PM"
      params[:thursday15][:teacher_id] = params[:teacher][:id]
      params.require(:thursday15).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def thursday16_params
      params[:thursday16][:school_year] = params[:schedule][:school_year]
      params[:thursday16][:schedule_day] = "thursday"
      params[:thursday16][:schedule_time] = "4PM - 5PM"
      params[:thursday16][:teacher_id] = params[:teacher][:id]
      params.require(:thursday16).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    #friday
    def friday8_params
      params[:friday8][:school_year] = params[:schedule][:school_year]
      params[:friday8][:schedule_day] = "friday"
      params[:friday8][:schedule_time] = "8AM - 9AM"
      params[:friday8][:teacher_id] = params[:teacher][:id]
      params.require(:friday8).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday9_params
      params[:friday9][:school_year] = params[:schedule][:school_year]
      params[:friday9][:schedule_day] = "friday"
      params[:friday9][:schedule_time] = "9AM - 10AM"
      params[:friday9][:teacher_id] = params[:teacher][:id]
      params.require(:friday9).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday10_params
      params[:friday10][:school_year] = params[:schedule][:school_year]
      params[:friday10][:schedule_day] = "friday"
      params[:friday10][:schedule_time] = "10AM - 11AM"
      params[:friday10][:teacher_id] = params[:teacher][:id]
      params.require(:friday10).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday11_params
      params[:friday11][:school_year] = params[:schedule][:school_year]
      params[:friday11][:schedule_day] = "friday"
      params[:friday11][:schedule_time] = "11AM - 12NN"
      params[:friday11][:teacher_id] = params[:teacher][:id]
      params.require(:friday11).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday13_params
      params[:friday13][:school_year] = params[:schedule][:school_year]
      params[:friday13][:schedule_day] = "friday"
      params[:friday13][:schedule_time] = "1PM - 2PM"
      params[:friday13][:teacher_id] = params[:teacher][:id]
      params.require(:friday13).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday14_params
      params[:friday14][:school_year] = params[:schedule][:school_year]
      params[:friday14][:schedule_day] = "friday"
      params[:friday14][:schedule_time] = "2PM - 3PM"
      params[:friday14][:teacher_id] = params[:teacher][:id]
      params.require(:friday14).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday15_params
      params[:friday15][:school_year] = params[:schedule][:school_year]
      params[:friday15][:schedule_day] = "friday"
      params[:friday15][:schedule_time] = "3PM - 4PM"
      params[:friday15][:teacher_id] = params[:teacher][:id]
      params.require(:friday15).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end

    def friday16_params
      params[:friday16][:school_year] = params[:schedule][:school_year]
      params[:friday16][:schedule_day] = "friday"
      params[:friday16][:schedule_time] = "4PM - 5PM"
      params[:friday16][:teacher_id] = params[:teacher][:id]
      params.require(:friday16).permit(:year_level_id, :section_id, :school_year, :description, :schedule_day, :schedule_time, :teacher_id)
    end
end
