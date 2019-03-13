class User < ApplicationRecord
  has_many :payments
  has_many :project_users, dependent: :destroy
  has_many :project, through: :project_users

  accepts_nested_attributes_for :project_users, allow_destroy: true

  validates :name, presence: true
end
