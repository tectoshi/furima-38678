class Item < ApplicationRecord
  validates :name,                  presence: true
  validates :description,           presence: true
  validates :category_id,           presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sales_status_id,       presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_status_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                 presence: true
  
end
