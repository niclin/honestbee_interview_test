RSpec.describe User, type: :model do
   it "can be set as admin" do
     user = build(:user)

     expect(user.is_admin).to be false

   end
end
