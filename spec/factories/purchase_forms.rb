FactoryBot.define do
  factory :purchase_form do
    postal_code    { '123-4567' }
    prefecture_id     { 3 }
    municipality          { '横浜市緑区' }
    address   { '青山1-1' }
    building_name  { '柳ビル103' }
    telephone_number         { '0906678889' }  
    token           { "sk_test_4cf82ff10dffe578bef34c14" }  
  end
end
