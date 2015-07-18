class MountPointsController < ApplicationController
  skip_authorize_resource :only => :new
  load_and_authorize_resource

  before_filter :find_mount_point,  except: [:new, :create, :index]
  before_filter :find_user,         except: [:index]
  before_filter :find_production,   except: [:index]

  def index
    @mount_points = MountPoint.all
  end

  def new
    @mount_point = MountPoint.new
  end

  def create
    @mount_point = MountPoint.create(mount_point_params)
    @mount_point.production = @production

    if @mount_point.save
      redirect_to user_productions_path(user_id: @user)
    else
      render action: 'new'
    end

  end

  def edit
  end

  def update
    if @mount_point.update_attributes(mount_point_params)
      redirect_to user_production_mount_point_path(user_id: @user,
                                                   production_id: @production,
                                                   mount_point_id: @mount_point)
    else
      render action: 'edit'
    end
  end

  def show
  end

  def delete
  end

  def destroy
    @mount_point.destroy
    redirect_to user_path(@user)
  end

  protected

  def mount_point_params
    params.require(:mount_point).permit(:format,
                                        :name)
  end

  def find_production
    @production = Production.find(params[:production_id])
  end

  def find_mount_point
    @mount_point = MountPoint.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
