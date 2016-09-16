class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :description
      t.integer :host_id, null: false
      t.datetime :time, null: false
      t.integer :location_id, null: false
      t.string :location_description

      t.timestamps(null: false)
    end
  end
end
