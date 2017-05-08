class HomeController < ApplicationController
  def index
  end

  def students_main
  end

  def change_password
  end

  def schedule
    @schedules = Schedule.paginate(:page => params[:page], :per_page => 20)
  end
end
