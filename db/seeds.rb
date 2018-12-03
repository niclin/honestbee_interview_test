require "faker"

def generate_admin_account
  u = User.new

  u.email = "admin@test.com"

  u.password = "123456"
  u.password_confirmation = "123456"

  u.is_admin = true
  u.save
end

def generate_fake_products
  10.times do
    Product.create(title: Faker::Commerce.product_name, price: Faker::Commerce.price)
  end
end

generate_admin_account
generate_fake_products

puts "Generate data from seed file done."
