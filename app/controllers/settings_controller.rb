class SettingsController < ApplicationController

  def show
    @setting = Setting.first
  end

  def update
  end
end
