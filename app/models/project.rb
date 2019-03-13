class Project < ApplicationRecord
  has_many :projects_users, dependent: :destroy
  has_many :users, through: :projects_users
  has_many :payments

  accepts_nested_attributes_for :projects_users, allow_destroy: true

  validates :name, presence: true
end
