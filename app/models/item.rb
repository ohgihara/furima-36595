class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :quality
  belongs_to :until_date
  belongs_to :user

  has_one_attached :image

  validates :item_name, presence: true
  validates :overview, presence: true
  validates :image, presence: true
  validates :price, presence: true
  validates :price, numericality: {
    with: /\A[0-9]+\z/,
    message: '半角数字のみで入力して下さい'
  }

  validates :price, inclusion: { in: 300..9_999_999, message: '価格設定は300円~9,999,999円以内です。' }

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :quality_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :until_date_id, numericality: { other_than: 1, message: "can't be blank" }
end
