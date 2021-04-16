class Request < ApplicationRecord
  has_many :offers, dependent: :destroy
  has_many :proposals, dependent: :destroy, through: :offers, source: :offer_detail

end
