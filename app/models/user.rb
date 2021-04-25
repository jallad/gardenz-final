class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_address, dependent: :destroy
  has_many :offers, dependent: :delete_all
  has_many :experiences, dependent: :delete_all
  has_and_belongs_to_many :skills
  has_many :proposals, through: :offers, source: :offer_detail

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
  validates :first_name, presence: {message: "First name is required"}

  alias_method :authenticate, :valid_password?

  def self.from_token_payload(payload)
    self.find payload["sub"]
  end
end
