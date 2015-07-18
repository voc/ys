class Production < ActiveRecord::Base
  belongs_to :user
  has_many :mount_points

  validates :title, presence: true,  uniqueness: true
  validates :description, presence: true
  validates :user, presence: true
end
