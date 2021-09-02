FactoryBot.define do
  factory :item do
    item_name               { 'test' }
    overview                { 'とても便利です' }
    category_id             { 2 }
    quality_id              { 2 }
    delivery_fee_id         { 2 }
    prefecture_id           { 2 }
    until_date_id           { 2 }
    price                   { 40_000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
