class Setting < ActiveRecord::Base

  def self.current
    if self.first.nil?
      self.create(&:to_s)
    end

    self.first
  end

  def mqtt?
    if self.mqtt_server.blank? &&
       self.mqtt_username.blank? &&
       self.mqtt_password.blank?

      false
    else
      true
    end
  end

  def icecast?
    self.icecast_server.blank? ? false : true
  end

  def welcome_description?
    self.welcome_description.blank? ? false : true
  end

  def api_key?
    self.api_key.blank? ? false : true
  end
end
