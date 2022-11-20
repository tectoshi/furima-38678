class Item < ApplicationRecord
  validates :name
  validates :description
  validates :category_id
  validates :sales_status_id
  validates :fee_status_id
  validates :prefecture_id
  validates :scheduled_delivery_id 
  validates :price
  
end
