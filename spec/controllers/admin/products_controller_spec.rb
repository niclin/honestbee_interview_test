RSpec.describe Admin::ProductsController, type: :controller do
  describe "GET index" do
    context "when user is admin" do
      let(:user) { create(:user, is_admin: true) }
      let(:product1) { create(:product) }
      let(:product2) { create(:product) }

      before do
        sign_in user

        get :index
      end

      it "assigns @products" do
        expect(assigns[:products]).to eq([product1, product2])
      end

      it "render template" do
        expect(response).to render_template("index")
      end
    end

    context "when user is not admin" do
      let(:user) { create(:user, is_admin: false) }

      before do
        sign_in user

        get :index
      end

      it "redirect_to root_path" do
        expect(response).to redirect_to root_path
      end
    end
  end
end
