class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :mqtt_server,  :null => false, default: ''
      t.string :mqtt_password, :null => false, default: ''
      t.string :mqtt_username, :null => false, default: ''

      t.text   :welcome_description, null: false, default: ''

      t.string :icecast_server, null: false, default: ''

      t.string :api_key
    end
  end
end
