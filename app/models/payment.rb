class Payment < ApplicationRecord
  belongs_to :project
  belongs_to :users

  validates :from, :to, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
end
