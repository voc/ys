class Production < ActiveRecord::Base
  belongs_to :user
  has_many :mount_points, dependent: :delete_all

  validates :title, presence: true,  uniqueness: true
  validates :description, presence: true
  validates :user, presence: true

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" },
                    path:":rails_root/public/system/:attachment/:id_partition_:style_:filename",
                    url: "/system/:attachment/:id_partition_:style_:filename"
  validates_attachment :logo,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
    size: { in: 0..512.kilobytes }
  validates_attachment_file_name :logo, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
