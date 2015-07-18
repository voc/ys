class MountPoints < ActiveRecord::Migration
  def change
    create_table :mount_points do |t|
      t.string     :name
      t.string     :description
      t.string     :format
      t.string     :password
      t.string     :user
      t.belongs_to :production

      t.timestamps
    end
  end
end
