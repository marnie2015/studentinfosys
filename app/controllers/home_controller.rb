class HomeController < ApplicationController
  before_filter :check_access, :except => [:index, :login]
  skip_before_action :verify_authenticity_token
  
  def index
  end

  def students_main
  end

  def change_password
  end

  def schedule
    @schedules = Schedule.paginate(:page => params[:page], :per_page => 20)
  end

  def login
    user = User.where(:user_name =>  params[:user_name], :user_pass => params[:user_pass])
    if user.count > 0
      session[:user] = user.first
      redirect_to "/main"
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
