FactoryBot.define do
  factory :user do
    nick_name { 'test' }
    email                 { Faker::Internet.free_email } 
    password              { 'mimi66' }
    password_confirmation { password }
    last_name              { '山田' }
    first_name             { '健介' }
    last_name_kana         { 'ヤマダ' }
    first_name_kana        { 'ケンスケ' }
    date_of_birth { '1957-05-16' }
  end
end
