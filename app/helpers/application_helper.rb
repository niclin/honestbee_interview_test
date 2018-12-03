module ApplicationHelper
  def render_premium_membership_label
    if user_signed_in? && current_user.has_premium_membership?
      link_to("Premium 會員", "#")
    else
      link_to("Upgrate", pricing_path)
    end
  end
end
