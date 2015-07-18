class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.string     :name
      t.datetime   :start_time
      t.datetime   :end_time
      t.belongs_to :user

      t.timestamps
    end
  end
end
