class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :request
  has_one :offer_detail
end
