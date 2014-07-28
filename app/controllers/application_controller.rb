class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	
	def is_admin?
		current_user.present? && current_user.admin?
	end

	def user_signed_in?
		@current_user.present?
	end

	helper_method :user_signed_in?

	helper_method :is_admin?

	def ensure_admin
		return unauthorized! unless current_user.present? && current_user.admin?
	end	

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
  
  private 
	
end
