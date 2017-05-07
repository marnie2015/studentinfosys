class GradesController < ApplicationController
  def index
    @students = Student.paginate(:page => params[:page], :per_page => 20)
  end
  
  def show
  end
end
