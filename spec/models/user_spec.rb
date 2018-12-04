RSpec.describe User, type: :model do
   it "can be set as admin" do
     user = build(:user, is_admin: true)

     expect(user.is_admin).to be true
   end

   it "can purchase premium membership" do
     user = create(:user)

     premium_membership_order = user.premium_membership_orders.create
     premium_membership_order.complete!

     expect(user.has_premium_membership?).to be true
   end
end
