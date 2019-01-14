# frozen_string_literal: true

class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.belongs_to :carts, foreign_key: true
      t.belongs_to :products, foreign_key: true
      t.decimal :price
      t.integer :qty_products

      t.datetime :deleted_at, null: true
      t.timestamps
    end
  end
end
