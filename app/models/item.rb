class Item < ApplicationRecord
  has_one_attached :image


  validates :name,                  presence: true
  validates :description,           presence: true
  validates :category_id,           presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sales_status_id,       presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_status_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                 presence: true
  validates :image,                 presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :SalesStatus
  belongs_to_active_hash :FeeStatus
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ScheduledDelivery
end
