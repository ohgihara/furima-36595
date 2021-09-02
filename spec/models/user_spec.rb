require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザ登録ができる時' do
      it 'nickname,email、last_nameとlast_name_kana,first_nameとfirst_name_kana,passwordとpassword_confirmation,date_of_birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザ登録ができない時' do
      it 'nick_nameが空では登録できない' do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれないと登録できない' do
        @user.email = 'ppppp'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '0a000'
        @user.password_confirmation = '0a000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'last_nameが全角文字でないと登録できない' do
        @user.last_name = '山田a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name に全角文字を使用してください')
      end
      it 'first_nameが全角文字でないと登録できない' do
        @user.first_name = '健介a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name に全角文字を使用してください')
      end
      it 'last_name_kanaが全角カタカナのみでないと登録できない' do
        @user.last_name_kana = 'ヤマダa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナのみで入力して下さい')
      end
      it 'first_name_kanaが全角カタカナのみでないと登録できない' do
        @user.first_name_kana = 'ケンスケa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナのみで入力して下さい')
      end
      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角6字以上、英・小文字・数字のみを一字以上入れる必要があります')
      end
      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角6字以上、英・小文字・数字のみを一字以上入れる必要があります')
      end
      it 'passwordが全角文字の場合は登録できない' do
        @user.password = '１１aa22'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角6字以上、英・小文字・数字のみを一字以上入れる必要があります')
      end
    end
  end
end
