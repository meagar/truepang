class CreateGameScores < ActiveRecord::Migration
  def change
    create_table :game_scores do |t|
      t.references :game, index: true
      t.references :player, index: true
      t.integer :score

      t.timestamps null: false
    end
    add_foreign_key :game_scores, :games
    add_foreign_key :game_scores, :players
  end
end
