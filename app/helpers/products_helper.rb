module ProductsHelper
  def render_price_by_membership(current_user, product)
    if current_user && current_user.has_premium_membership?
      product.discount_price
    else
      product.price
    end
  end
end
