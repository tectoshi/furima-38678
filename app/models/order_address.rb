class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, 
                :city, :address, :phone_number, :building, :token
 
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code,   format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :city 
    validates :address
    validates :phone_number,  format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :token
  end


  def save
    # 購入履歴を保存し、変数orderに代入する
    order = Order.create( user_id: user_id, item_id: item_id )
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create( postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, 
                    building: building, phone_number: phone_number, order_id: order.id)
  end
end