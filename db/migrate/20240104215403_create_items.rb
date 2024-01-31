class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :price, default: 0, null: false
      t.decimal :quantity, default: 0, null: false

      t.timestamps
    end
  end
end
