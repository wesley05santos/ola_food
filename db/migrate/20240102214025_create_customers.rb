class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.integer :number_of_address
      t.string :neighborhood

      t.timestamps
    end
  end
end
