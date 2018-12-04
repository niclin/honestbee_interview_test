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

  describe "GET new" do
    context "when user is admin" do
      let(:user) { create(:user, is_admin: true) }
      let(:product) { build(:product) }

      before do
        sign_in user

        get :new
      end

      it "assigns @product" do
        expect(assigns[:product]).to be_a_new(Product)
      end

      it "render template" do
        expect(response).to render_template("new")
      end
    end

    context "when user is not admin" do
      let(:user) { create(:user, is_admin: false) }

      before do
        sign_in user

        get :new
      end

      it "redirect_to root_path" do
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "POST create" do
    context "when user is admin" do
      let(:user) { create(:user, is_admin: true) }
      let(:product) { build(:product) }

      before do
        sign_in user
      end

      it "doesn't create a record" do
        expect do
          post :create, params: { product: { title: nil, price: nil } }
        end.to change { Product.count }.by(0)
      end

      it "create a new produce record" do
        expect do
          post :create, params: { product: attributes_for(:product) }
        end.to change { Product.count }.by(1)
      end
    end

    context "when user is not admin" do
      let(:user) { create(:user, is_admin: false) }

      before do
        sign_in user

        post :create
      end

      it "redirect_to root_path" do
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "GET edit" do
    context "when user is admin" do
      let(:user) { create(:user, is_admin: true) }
      let(:product) { create(:product) }

      before do
        sign_in user

        get :edit, params: { id: product.id }
      end

      it "assigns product" do
        expect(assigns[:product]).to eq(product)
      end

      it "renders template" do
        expect(response).to render_template("edit")
      end
    end

    context "when user is not admin" do
      let(:user) { create(:user, is_admin: false) }
      let(:product) { create(:product) }

      before do
        sign_in user

        get :edit, params: { id: product.id }
      end

      it "redirect_to root_path" do
        expect(response).to redirect_to root_path
      end
    end
  end
end
