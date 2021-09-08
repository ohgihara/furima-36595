class PurchaseForm

 include ActiveModel::Model
 attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number, :user_id, :item_id, :token

 with_options presence: true do
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフン込みの7桁半角数字で入力してください。"}
  validates :municipality
  validates :address
  validates :telephone_number, format: {with: /\A\d{10}\z/, message: "10桁の半角数字で入力してください。"}
  validates :token
 end
 validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

 def save
  item_log = ItemLog.create(item_id: item_id, user_id: user_id)

  Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number,item_log_id: item_log.id)

 end
end
