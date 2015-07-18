class UsersController < ApplicationController
  load_and_authorize_resource

  before_filter :find_user, except: [:new, :create, :index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_user_params)

    if @user.save
      redirect_to login_path
    else
      render action: :new
    end
  end

  def show
    @productions = @user.productions
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render action: :edit
    end
  end

  def delete
  end

  def destroy
    @user.destroy
    redirect_to people_path
  end

  protected

  def find_user
    @user = User.find(params[:id])
  end

  def create_user_params
    params.require(:user).permit(:login,
                                 :password,
                                 :village,
                                 :dect,
                                 :email,
                                 :admin)
  end

  def user_params
    if current_user.nil? || current_user.admin? == false
      params.require(:user).permit(:login,
                                   :password,
                                   :village,
                                   :dect,
                                   :email)
    elsif current_user.admin?
      params.require(:user).permit(:login,
                                   :password,
                                   :village,
                                   :dect,
                                   :email,
                                   :admin)
    end
  end
end
