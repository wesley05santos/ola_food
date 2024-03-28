class AddColumnToOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :paid, :boolean, null: false, default: false
  end
end
