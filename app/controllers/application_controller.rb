class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper :all
  
  before_filter :set_current_person

  private
  
  def set_current_person
    @current_user ||= (User.find(session[:user_id]) if session[:user_id] ) || (User.find( *cookies.signed[:remember_me] ) if cookies.signed[:remember_me] )
  end
  
  def login_required
    session[:return_to] = request.fullpath
    redirect_to "/auth/twitter" if !@current_user
  end

end