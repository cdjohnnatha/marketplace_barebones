class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price, default: 0.00
      t.integer :qty_available, default: 0

      t.datetime :deleted_at, null: true
      t.timestamps
    end
  end
end
