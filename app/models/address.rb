class Address < ApplicationRecord
  #belongs_to :order

  with_options presence: true do
    validates :postal_code,   format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city 
    validates :addresses
    validates :phone_number,  format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
end

  validates :building
end
