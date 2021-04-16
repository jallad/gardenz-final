class Request < ApplicationRecord
  has_many :offers
  has_many :proposals, through: :offers, source: :offer_detail

end
