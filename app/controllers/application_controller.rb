class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :signed_in?, :current_user, :current_user_name

  def signed_in?
    session[:user_id]
  end

  def current_user
    session[:user_id] && User.find(session[:user_id])
  end

  def current_user_name
    session[:user_name]
  end

  def sign_in(user)
    session[:user_id] = user.id
    session[:user_name] = user.name
  end

  def sign_out
    session[:user_id] = nil
    session[:user_name] = nil
  end
end
