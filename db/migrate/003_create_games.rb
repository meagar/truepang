class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :match, index: true
      t.timestamp :finished_at

      t.timestamps null: false
    end
    add_foreign_key :games, :matches
  end
end
