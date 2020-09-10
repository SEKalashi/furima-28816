require 'rails_helper'

RSpec.describe OrderSale, type: :model do
  describe '商品購入情報の保存' do
    before do
      @order_sale = FactoryBot.build(:order_sale)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_sale).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @order_sale.postal_code = nil
      @order_sale.valid?
      expect(@order_sale.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeにハイフンがないと保存できないこと' do
      @order_sale.postal_code = '1234567'
      @order_sale.valid?
      expect(@order_sale.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it 'prefecture_idが未選択だと保存できないこと' do
      @order_sale.prefecture_id = '0'
      @order_sale.valid?
      expect(@order_sale.errors.full_messages).to include('Prefecture Select')
    end

    it 'addressが空だと保存できないこと' do
      @order_sale.address = nil
      @order_sale.valid?
      expect(@order_sale.errors.full_messages).to include("Address can't be blank")
    end

    it 'house_numberが空だと保存できないこと' do
      @order_sale.house_number = nil
      @order_sale.valid?
      expect(@order_sale.errors.full_messages).to include("House number can't be blank")
    end

    it 'telephone_numberが空だと保存できないこと' do
      @order_sale.telephone_number = nil
      @order_sale.valid?
      expect(@order_sale.errors.full_messages).to include("Telephone number can't be blank")
    end

    it 'telephone_numberが半角数字以外で保存できないこと' do
      @order_sale.telephone_number = '０８０１２３４５６７８'
      @order_sale.valid?
      expect(@order_sale.errors.full_messages).to include('Telephone number is invalid. Input half-width integer.')
    end

    it 'house_nameは空でも保存できること' do
      @order_sale.house_name = nil
      expect(@order_sale).to be_valid
    end
  end
end
