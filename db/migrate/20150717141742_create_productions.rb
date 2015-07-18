class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.string     :title
      t.datetime   :start_time
      t.datetime   :end_time
      t.text       :description
      t.belongs_to :user

      t.timestamps
    end
  end
end
