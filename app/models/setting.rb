class Setting < ActiveRecord::Base

  def mqtt?
    if self.mqtt_server.empty? a&&
      self.mqtt_username.empty? &&
      self.mqtt_password.empty?

      true
    else
      false
  end
end
