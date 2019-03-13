class ProjectsUser < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum typeofrate: [:hour, :month]
  enum currency: [:RUB, :USD, :ETH, :BTC]

  validates :typeofrate, :currency, :rate, presence: true
  validates :rate, numericality: { greater_than: 0 }
end
