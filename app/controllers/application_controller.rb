class ApplicationController < ActionController::Base
  protect_from_forgery


private
  def current_user
    @user ||= Employee.find_by_id(session[:user_id]) if logged_in?
  end

  def logged_in?
    session[:user_id]
  end

  helper_method :current_user, :logged_in
end
