RSpec.describe Product, type: :model do
  it "is invalid without a title" do
    product = Product.new(title: nil)

    product.valid?

    expect(product.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a price" do
    product = Product.new(price: nil)

    product.valid?

    expect(product.errors[:price]).to include("can't be blank")
  end
end
