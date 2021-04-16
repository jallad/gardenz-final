class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_one :offer_detail, dependent: :destroy
  # accepts_nested_attributes_for :offer_detail
end
