class Payment < ApplicationRecord
  belongs_to :project
  belongs_to :users

  validates :from, :to, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }

  scope :unpayed, -> { where('to_pay < amount') }
  scope :payed, -> { where('to_pay > amount') }
end
