class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :user, index: true
      t.references :match, index: true

      t.timestamps null: false
    end
    add_foreign_key :players, :users
    add_foreign_key :players, :matches
  end
end
