class UserSessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) if current_user

    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.create(params[:user_session])

    if @user_session.valid?
      redirect_to user_path(current_user)
    else
      render :action => :new
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy

    redirect_to new_session_path
  end
end
