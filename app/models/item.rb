class Item < ApplicationRecord
  has_one_attached :image

  validates :name,                  presence: true, length: { maximum: 40 }
  validates :description,           presence: true, length: { maximum: 1000 }
  validates :category_id,           presence: true, 
                                    numericality: { other_than: 1 , message: "can't be blank"}
  validates :sales_status_id,       presence: true, 
                                    numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_status_id,         presence: true, 
                                    numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,         presence: true, 
                                    numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, presence: true, 
                                    numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                 presence: true, 
                                    numericality: {only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999};
  ## format: {with: /A[0-9]+\Z/} ,をプライスにつけるのはダメなのか？
  
  validates :image,                 presence: true
 
  
  belongs_to :user
  has_one :order
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :Category
  belongs_to_active_hash :SalesStatus
  belongs_to_active_hash :FeeStatus
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ScheduledDelivery
end
