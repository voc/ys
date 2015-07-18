class Production < ActiveRecord::Base
  belongs_to :user
  has_many :mount_points
end
