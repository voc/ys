class MountPoint < ActiveRecord::Base
  belongs_to :production

  validates :name, presence: true

  FORMATS = {
    mp3:  { type: 'audio', mime_type: 'audio/mpeg' },
    oga:  { type: 'audio', mime_type: 'audio/ogg'},
    ogg:  { type: 'video', mime_type: 'video/ogg'},
    opus: { type: 'audio', mime_type: 'audio/ogg'}
  }

end
