RSpec.describe Admin::ProductsController, type: :controller do
  context "when user is not login" do
    it "redirect_to new_user_session_path" do
      get :new

      expect(response).to redirect_to new_user_session_path
    end
  end
end
