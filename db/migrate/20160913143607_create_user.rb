class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :hashed_password, null: false
      t.string :user_type
      t.integer :location_id

      t.timestamps(null: false)
    end
  end
end
