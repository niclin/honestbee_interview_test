RSpec.describe "Product List", type: :feature do
  scenario "display list of products" do
    create(:product)

    visit root_url

    expect(page).to have_css "span.product-title"
  end
end
