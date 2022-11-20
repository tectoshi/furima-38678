require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる' do
      it 'name,description,,priceが存在したら保存できる' do
        expect(@item).to be_valid
      end
    end
  end
end

