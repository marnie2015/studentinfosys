class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_access
    if session[:user].nil?
      render file: "public/404.html", layout: false
    end
  end

  def student_access_only
      render file: "public/404.html", layout: false if session[:user]["access"] != 3
  end

  def admin_access_only
      render file: "public/404.html", layout: false if session[:user]["access"] == 3
  end
end
