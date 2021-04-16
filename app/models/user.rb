class User < ApplicationRecord
  has_secure_password
  has_one :user_address, dependent: :destroy
  has_many :offers, dependent: :delete_all
  has_and_belongs_to_many :skills
  has_many :proposals, through: :offers, source: :offer_detail

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
  validates :first_name, presence: {message: "First name is required"}
end
