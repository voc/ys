class SettingsController < ApplicationController
  load_and_authorize_resource

  before_filter :find_setting

  def show
  end

  def edit
  end

  def update
    if @setting.update_attributes(setting_params)
      redirect_to setting_path(@setting)
    else
      render action: 'edit'
    end
  end

  def generate_api_key
    @setting.api_key = SecureRandom.hex
    render action: 'edit'
  end

  protected

  def setting_params
    params.require(:setting).permit(:mqtt_server,
                                    :mqtt_username,
                                    :mqtt_password,
                                    :welcome_description,
                                    :icecast_server,
                                    :api_key)
  end

  def find_setting
    @setting = Setting.current
  end
end
