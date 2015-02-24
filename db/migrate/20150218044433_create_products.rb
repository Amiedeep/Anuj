class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :type_of_product
      t.string :name
      t.string :company
      t.string :price

      t.timestamps null: false
    end
  end
end
