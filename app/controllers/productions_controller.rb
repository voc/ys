class ProductionsController < ApplicationController
  load_and_authorize_resource

  before_filter :find_production, except: [:new, :create, :index]
  before_filter :find_user, except: [:new, :index]

  def index
    @productions = Production.all
  end

  def new
    @production = Production.new
  end

  def create
    @production = Production.create(production_params)
    @production.user = @user

    if @production.save
      redirect_to user_path(@user)
    else
      render action: 'new'
    end

  end

  def edit
  end

  def update
    if @production.update_attributes(production_params)
      redirect_to user_production_path(user_id: @user, production_id: @production)
    else
      render action: 'edit'
    end
  end

  def show
  end

  def delete
  end

  def destroy
    @production.destroy
    redirect_to user_path(@user)
  end

  def remove_logo
    @production.logo.destroy
    @production.logo = nil
    @production.save

    render action: 'edit'
  end

  protected

  def production_params
    params.require(:production).permit(:title,
                                       :description,
                                       :start_time,
                                       :end_time,
                                       :logo)
  end

  def find_production
    @production = Production.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
