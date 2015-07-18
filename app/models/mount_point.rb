class MountPoint < ActiveRecord::Base
  belongs_to :production

  validates :name, presence: true
  validates :format, presence: true

  FORMATS = {
    mp3:  'audio/mpeg',
    oga:  'audio/ogg',
    ogg:  'video/ogg',
    opus: 'audio/ogg',
    webm: 'video/webm'
  }

end
