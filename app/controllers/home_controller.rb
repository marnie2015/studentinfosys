class HomeController < ApplicationController
  before_filter :check_access, :except => [:index, :login]
  skip_before_action :verify_authenticity_token
  
  def index
  end

  def main
    admin_access_only
  end

  def students_main
    student_access_only
  end

  def change_password
    student_access_only
  end

  def schedule
    @schedules = Schedule.paginate(:page => params[:page], :per_page => 20)
  end

  def login
    user = User.where(:user_name =>  params[:user_name], :user_pass => params[:user_pass])
    if user.count > 0
      session[:user] = user.first
      redirect_to "/main" if user.first.access == 1
      redirect_to "/students-main" if user.first.access == 3
    else
      session[:user] = nil
      render :inline => "error"
    end
  end

  def logout
    session[:user] = nil
    redirect_to "/"
  end
end
