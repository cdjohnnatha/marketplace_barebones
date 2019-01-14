# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.belongs_to :user, foreign_key: true
      t.decimal :total_amount, default: 0.00
      t.integer :state, limit: 1, default: 0

      t.datetime :deleted_at, null: true
      t.timestamps
    end
  end
end
