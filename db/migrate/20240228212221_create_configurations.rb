class CreateConfigurations < ActiveRecord::Migration[7.1]
  def change
    create_table :configurations do |t|
      t.references :user, null: true, foreign_key: true
      t.string :colors, array: true, default: []

      t.timestamps
    end
  end
end
