require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('spec/image/121043663.png', 'image/png')
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it 'nameとpriceとimageとintroductionとcategory_idとitem_condition_idとpostage_payer_idとarea_idとpreparation_day_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'category_idが1以外の場合登録できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'item_condition_idが1以外の場合登録できる' do
        @item.item_condition_id = 2
        expect(@item).to be_valid
      end
      it 'postage_payer_idが1以外の場合登録できる' do
        @item.postage_payer_id = 2
        expect(@item).to be_valid
      end
      it 'area_idが1以外の場合登録できる' do
        @item.area_id = 2
        expect(@item).to be_valid
      end
      it 'preparation_day_idが1以外の場合登録できる' do
        @item.preparation_day_id = 2
        expect(@item).to be_valid
      end
      it 'priceが300以上の数値の場合登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceが9,999,999以下の数値の場合登録できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'nameが空では登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'introductionが空では登録できない' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'item_condition_idが1では登録できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item condition must be other than 1')
      end
      it 'postage_payer_idが1では登録できない' do
        @item.postage_payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer must be other than 1')
      end
      it 'area_idが1では登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 1')
      end
      it 'preparation_day_idが1では登録できない' do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Preparation day must be other than 1')
      end
      it 'priceが300以上ではない場合登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it 'priceが9,999,999以下ではない場合登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it 'priceが数値ではない場合登録できない' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
