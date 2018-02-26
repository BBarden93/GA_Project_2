class CreateSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :spots do |t|
      t.string :location
      t.string :description
      t.string :obstacles
      t.string :level_of_difficulty
      t.string :image
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
