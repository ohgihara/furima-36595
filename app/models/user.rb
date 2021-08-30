class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :item_logs

  validates :nick_name, presence: true
  validates :date_of_birth, presence: true

  with_options presence: true, format: { with: /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/, message: 'に全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end

  validates :last_name_kana, presence: true,
                             format: {
                               with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                               message: '全角カタカナのみで入力して下さい'
                             }

  validates :first_name_kana, presence: true,
                              format: {
                                with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                                message: '全角カタカナのみで入力して下さい'
                              }

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true,
                       format: { with: VALID_PASSWORD_REGEX,
                                 message: 'は半角6字以上、英・小文字・数字のみを一字以上入れる必要があります' }
end
