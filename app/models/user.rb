class User < ApplicationRecord
  has_many :payments
  has_many :projects_users, dependent: :destroy
  has_many :projects, through: :projects_users

  accepts_nested_attributes_for :projects_users, allow_destroy: true

  validates :name, presence: true

  def current_payments
    payments.unpayed
  end

  def old_payments
    payments.payed
  end
end
