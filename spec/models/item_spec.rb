require 'rails_helper'
RSpec.describe Item do
  before do
    @items = FactoryBot.build(:item)
    @items.image = fixture_file_upload('public/test.jpg')
  end

  describe '商品新規登録' do
    context '新規商品登録がうまくいくとき' do
      # it 'ユーザーがログインしていればが出品ページへ遷移できる' do
      #   visit  new_user_session_path
      #   fill_in 'user_email', with: @user.email
      #   fill_in 'user_password', with: @user.password
      #   visit new_item_path
      #   expect(current_path).to eq new_item_path
      # end

      it '商品データが存在すれば登録できる' do
        expect(@items).to be_valid
      end
    end

    context '新規商品登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @items.name = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Name can't be blank")
      end

      it 'imageが空では登録できない' do
        @items.image = nil
        @items.valid?
        expect(@items.errors.full_messages).to include("Image can't be blank")
      end

      it '商品説明が空では登録できない' do
        @items.description = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリー情報が空では登録できない' do
        @items.category_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Category Select')
      end

      it '商品ステータス情報が空では登録できない' do
        @items.status_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Status Select')
      end

      it '配送の負担情報が空では登録できない' do
        @items.delivery_charge_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Delivery charge Select')
      end

      it '発送元の地域情報が空では登録できない' do
        @items.sending_area_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Sending area Select')
      end

      it '発送までの日数情報が空では登録できない' do
        @items.shipping_time_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Shipping time Select')
      end

      it '商品価格が¥300~¥9,999,999間では無いと登録できない' do
        @items.price = '100'
        @items.valid?
        expect(@items.errors.full_messages).to include('Price is out of setting range')
      end

      it '商品価格が半角数字のみでないと登録できない' do
        @items.price = '１０００'
        @items.valid?
        expect(@items.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
