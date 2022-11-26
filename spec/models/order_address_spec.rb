require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
      it 'すべての値が正しく入力されている場合' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      ## 値が空のテスト
      it 'postal_codeが空だと購入できない' do
        @order_address.postal_code = ""        
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")       
      end
      it 'prefecture_idが空だと購入できない' do
        @order_address.prefecture_id = ""        
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank") 
      end
      it 'cityが空だと購入できない' do
        @order_address.city = ""        
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank") 
      end
      it 'addressが空だと購入できない' do
        @order_address.address = ""        
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank") 
      end
      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = ""        
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank") 
      end
      it 'tokenが空だと購入できない' do
        @order_address.city = ""        
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank") 
      end
      it 'userが紐づいていないと購入できない' do
        @order_address.user_id = nil        
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank") 
      
      end
      it 'itemが紐づいていないと購入できない' do
        @order_address.item_id = nil        
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank") 
      end
      ##// 値が空のテスト

      it 'postal_codeがハイフンを含む正しい形でないと購入できない' do
        @order_address.postal_code = "1234567"        
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが1の時は購入できない' do
        @order_address.prefecture_id = "1"        
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank") 
      end
      it 'phone_numberが9文字以下だと購入できない' do
        @order_address.phone_number = "123456789"        
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid") 
      end
      it 'phone_numberが12文字以上だと購入できない' do
        @order_address.phone_number = "111111111111"        
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid") 
      end
      it 'phone_numberが半角数字以外だと購入できない' do
        @order_address.phone_number = "a１00000000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid") 
      end
    end
  end
end
