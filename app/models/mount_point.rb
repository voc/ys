class MountPoint < ActiveRecord::Base
  belongs_to :production

  validates :name, presence: true, format: /\A[a-zA-Z\s0-9]+\z/
  validates :format, presence: true

  before_save  :check_password

  FORMATS = {
    mp3:  'audio/mpeg',
    oga:  'audio/ogg',
    ogg:  'video/ogg',
    opus: 'audio/ogg',
    webm: 'video/webm'
  }

  EXTMAP = {
    'audio/mpeg' => 'mp3',
    'audio/ogg'  => 'oga',
    'video/ogg'  => 'ogg',
    'audio/ogg'  => 'ogg',
    'video/webm' => 'webm'
  }

  def extname
    ".#{EXTMAP[self.format]}"
  end

  def mount_name
    "/#{normalized_name}#{extname}"
  end

  def normalized_name
    self.name.gsub(' ', '_')
  end

  def uri
    URI("#{Setting.current.icecast_server}#{self.mount_name}")
  end

  def send_mqtt_message
    return false unless Setting.current.mqtt?

    server = {
      dest: Setting.current.mqtt_server,
      user: Setting.current.mqtt_username,
      password: Setting.current.mqtt_password
    }

    message = {
      humans: {
        path: '/voc/alert',
        text: "'#{User.find(self.production.user_id).login}' created mount point '#{mount_name}' in '#{production.title}'.",
        level: 'info'
      },
      machines: {
        path: '/voc/ys/mount_points',
        text: "'#{User.find(self.production.user_id).login}' created mount point '#{mount_name}' in '#{production.title}'.",
        level: 'info'
      }
    }

    MqttClient.send_message(server, message)
  end

  protected

  def check_password
    if password.blank?
      self.password = SecureRandom.hex
    end
  end
end
