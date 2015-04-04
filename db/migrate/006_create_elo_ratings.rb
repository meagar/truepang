class CreateEloRatings < ActiveRecord::Migration
  def change
    create_table :elo_ratings do |t|
      t.references :user, index: true
      t.references :match, index: true
      t.float :in
      t.float :out

      t.timestamps null: false
    end
    add_foreign_key :elo_ratings, :users
    add_foreign_key :elo_ratings, :matches
  end
end
