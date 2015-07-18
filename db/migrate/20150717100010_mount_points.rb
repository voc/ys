class MountPoints < ActiveRecord::Migration
  def change
    create_table :mount_points do |t|
      t.string     :name
      t.string     :format
      t.string     :user_name, default: 'relay'
      t.string     :password
      t.belongs_to :production

      t.timestamps
    end
  end
end
