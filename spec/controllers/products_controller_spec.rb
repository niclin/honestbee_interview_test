RSpec.describe ProductsController, type: :controller do
  describe "GET index" do
    before do
      @product1 = create(:product)
      @product2 = create(:product)
    end

    it "assigns @products and render" do
      get :index

      expect(assigns[:products]).to eq([@product1, @product2])
    end

    it "render template" do
      get :index

      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns @product" do
      product = create(:product)

      get :show, params: { id: product.id }

      expect(assigns[:product]).to eq(product)
    end

    it "render template" do
      product = create(:product)

      get :show, params: { id: product.id }

      expect(response).to render_template("show")
    end
  end
end
