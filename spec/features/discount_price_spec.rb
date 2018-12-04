RSpec.describe "Discount Price", type: :feature do
  let(:user) { create(:user) }
  let(:product) { create(:product) }

  before { sign_in user }

  scenario "display for premium membership" do
    allow(user).to receive(:has_premium_membership?).and_return(true)

    visit product_url(product)

    expect(page).to have_text "Premium 會員價"
  end

  scenario "undisplay for normal user" do
    allow(user).to receive(:has_premium_membership?).and_return(false)

    visit product_url(product)

    expect(page).not_to have_text "Premium 會員價"
  end
end
