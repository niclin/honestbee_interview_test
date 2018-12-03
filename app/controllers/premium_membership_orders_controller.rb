class PremiumMembershipOrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @premium_membership_order = current_user.premium_membership_orders.new
  end

  def create
    @premium_membership_order = current_user.premium_membership_orders.new

    # Skip payment
    @premium_membership_order.complete

    if @premium_membership_order.save
      redirect_to root_path, notice: "購買會員成功"
    else
      render :new
    end
  end
end
