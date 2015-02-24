class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :name
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
