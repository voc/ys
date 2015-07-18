class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :mqtt_server
      t.string :mqtt_password
      t.string :mqtt_username
      t.text   :welcome_description
    end
  end
end
