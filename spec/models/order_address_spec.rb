require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '購入がうまくいくとき' do
      it 'post_codeとarea_idとcityとhouse_numberとbuilding_nameとphone_numberが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが存在しなくても登録できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'post_codeが空では登録できない' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'area_idが1では登録できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空では登録できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが空では登録できない' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'post_codeにハイフンが存在しない場合登録できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号ハイフンを使用してください")
      end
      it 'phone_numberにハイフンが存在する場合登録できない' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号11桁以内でハイフンは使用しないでください")
      end
      it 'phone_numberが11桁以内ではない場合登録できない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号11桁以内でハイフンは使用しないでください")
      end
    end
  end
end
