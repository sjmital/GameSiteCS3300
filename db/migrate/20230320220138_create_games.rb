class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :platform
      t.string :description
      t.string :genre
      t.integer :releaseDate

      t.timestamps
    end
  end
end
