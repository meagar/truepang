class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.timestamp :finished_at

      t.timestamps null: false
    end
  end
end
