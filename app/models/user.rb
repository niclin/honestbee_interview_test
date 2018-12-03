class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :premium_membership_orders

  def admin?
    is_admin
  end

  def has_premium_membership?
    premium_membership_orders.complete.exists?
  end
end
