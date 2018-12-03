class CreatePremiumMembershipOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :premium_membership_orders do |t|
      t.integer :user_id
      t.string :payment_state, default: "initial"

      t.timestamps
    end
  end
end
