class PremiumMembershipOrder < ApplicationRecord
  belongs_to :user

  include AASM

  aasm column: :payment_state do
    state :initial, initial: true
    state :complete

    event :complete do
      transitions to: :complete, from: :initial
    end
  end
end
