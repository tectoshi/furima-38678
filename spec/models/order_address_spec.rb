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
      
      end
      it 'buildingがからでも購入できる' do
      
      end
    end

    context '商品購入できない場合' do
      ## 値が空のテスト
      it 'postal_codeが空だと購入できない' do
      
      end
      it 'prefecture_idが空だと購入できない' do
      
      end
      it 'cityが空だと購入できない' do
      
      end
      it 'addressが空だと購入できない' do
      
      end
      it 'phone_numberが空だと購入できない' do
      
      end
      it 'tokenが空だと購入できない' do
      
      end
      it 'userが紐づいていないと購入できない' do
      
      end
      it 'itemが紐づいていないと購入できない' do
      
      end
      ##// 値が空のテスト

      it 'postal_codeがハイフンを含む正しい形でないと購入できない' do
      
      end
      it 'prefecture_idが1の時は購入できない' do
      
      end
      it 'phone_numberが9文字以下だと購入できない' do
      
      end
      it 'phone_numberが12文字以上だと購入できない' do
      
      end
      
    end
  end
end
