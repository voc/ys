class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user_session, :current_user

  rescue_from(CanCan::AccessDenied) do
    unless current_user
      redirect_to new_session_path
    else
      redirect_to user_path(current_user)
    end
  end

  private

  def current_user_session
    @current_user_session ||= UserSession.find
  end

  def current_user
    @current_user ||= current_user_session.try(:record)
  end

  def store_location
    session[:return_to] = request.request_uri
  end
end
