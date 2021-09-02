require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '出品ができる時' do
      it 'item_name,overview,category,quality,delivery_fee,until_date,prefecture,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品ができない時' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'overviewが空では登録できない' do
        @item.overview = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Overview can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'quality_idが空では登録できない' do
        @item.quality_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      it 'delivery_fee_idが空では登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'until_date_idが空では登録できない' do
        @item.until_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Until date can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが半角数値でなければ保存できない' do
        @item.price = '１１２２'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 半角数字のみで入力して下さい')
      end
      it 'priceが300円~9,999,999円でなければ保存できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格設定は300円~9,999,999円以内です。')
      end
    end
  end
end
