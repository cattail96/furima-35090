require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, item_id: @item.id, user_id: @user.id)
    sleep(1)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it '必要事項が全て正しく存在すれば登録できること' do
        expect(@order_address).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'tokenが空だと登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'prefecture_idが0以外を選択されていないと登録できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'postal_codeにハイフンがないと登録できない' do
        @order_address.postal_code = 1234567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'postal_codeは3桁-4桁以外の桁数の半角数字だと登録できない' do
        @order_address.postal_code = 123-123
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'phone_numberは11桁以上だと登録できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは全角数字では登録できない' do
        @order_address.phone_number = '１２３４５６７８９０１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
