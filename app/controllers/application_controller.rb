class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
  
    private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
  
    def authenticate_user!
      redirect_to new_session_path, alert: 'Please log in first.' unless logged_in?
    end
  end
  