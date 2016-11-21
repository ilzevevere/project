class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#"current_user" method is created to check if a user is logged in

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  #def require_login
  	#if session[:user_id] == nil
  	  #redirect_to root_path
  	#end
  #end
  
  #setting current_user method as an helper_method so that it can be used in views as well
  helper_method :current_user
  #helper_method :require_login
  
end
