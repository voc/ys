class Setting < ActiveRecord::Base

  def self.current
    if self.first.nil?
      self.create(&:to_s)
    end

    self.first
  end

  def mqtt?
    if self.mqtt_server.empty? &&
       self.mqtt_username.empty? &&
       self.mqtt_password.empty?

      false
    else
      true
    end
  end

  def icecast?
    self.icecast_server.empty? ? false : true
  end

  def welcome_description?
    self.welcome_description.empty? ? false : true
  end

  def api_key?
    self.api_key.empty? ? false : true
  end
end
