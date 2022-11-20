class Item < ApplicationRecord
  validates :name,                  presence: true
  validates :description,           presence: true
  validates :category_id,           presence: true
  validates :sales_status_id,       presence: true
  validates :fee_status_id,         presence: true
  validates :prefecture_id,         presence: true
  validates :scheduled_delivery_id, presence: true
  validates :price,                 presence: true
  
end
