require 'rails_helper'
RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end

  describe '商品購入' do
    context '商品購入ができる時' do
      it 'postal_code,prefecture_id,municipality,address,building_name,telephone_number,tokenが存在すれば登録できる' do
        expect(@purchase_form).to be_valid
      end
    end

    context '商品購入ができない時' do
      it 'postal_codeが空では登録できない' do
        @purchase_form.postal_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは「3桁ハイフン4桁」の半角文字列でないと登録できない' do
        @purchase_form.postal_code = '33４５５５６'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code ハイフン込みの7桁半角数字で入力してください\b。")
      end
      it 'prefecture_idが空では登録できない' do
        @purchase_form.prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空では登録できない' do
        @purchase_form.municipality = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では登録できない' do
        @purchase_form.address = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空では登録できない' do
        @purchase_form.telephone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10桁以上11桁以内の半角数値のみでないと登録できない' do
        @purchase_form.telephone_number = '７７７７4445633'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Telephone number 10桁の半角数字で入力してください。")
      end
      it "tokenが空では登録できないこと" do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end