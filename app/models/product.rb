class Product < ApplicationRecord
  
  validates :title, presence: true
  validates :qty_available, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
