class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :username, null: false
      t.string :image
      t.string :uid, null: false

      t.float :elo_rating

      t.boolean :active, null: false, default: true

      t.timestamps null: false
    end
  end
end
