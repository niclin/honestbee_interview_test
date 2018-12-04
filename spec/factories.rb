FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "123456" }
    password_confirmation { "123456" }
  end

  factory :product do
    title { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
  end
end
