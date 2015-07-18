class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :crypted_password, null: false
      t.string :password_salt, null: false

      t.string    :persistence_token,   :null => false
      t.string    :single_access_token, :null => false
      t.string    :perishable_token,    :null => false
      t.boolean   :admin, default: false

      t.string :village
      t.string :dect
      t.string :email

      t.timestamps
    end
  end
end
