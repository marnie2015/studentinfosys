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
    user_name = User.where(:user_name =>  params[:user_name])
    if user_name.count > 0
        if user_name.first.tries.to_i == 3
          redirect_to "/", notice: "Your account has been disabled!"
        else
          user = user_name.where(:user_pass => params[:user_pass])
          if user.count > 0
            session[:user] = user.first
            user.first.update(:tries => 0)
            redirect_to "/main" if user.first.access == 1 || user.first.access == 2
            redirect_to "/students-main" if user.first.access == 3
          else
              user_name.first.update(:tries => user_name.first.tries.to_i + 1)
              if user_name.first.tries.to_i == 3
                redirect_to "/", notice: "Your account has been disabled!"
              else
                session[:user] = nil
                redirect_to "/", notice: "Error: Invalid username or password!"
              end
          end
        end
    else
      session[:user] = nil
      redirect_to "/", notice: "Error: Invalid username or password!"
    end
  end

  def logout
    session[:user] = nil
    redirect_to "/"
  end
end
