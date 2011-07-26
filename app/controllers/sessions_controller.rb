class SessionsController < ApplicationController
  def create
    cookies.delete :remember_me
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    cookies.permanent.signed[:remember_me] = user.id
    redirect_to (session[:return_to] || root_path), :notice => "Signed in!"
  end
  
  def destroy
    cookies.delete :remember_me
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
