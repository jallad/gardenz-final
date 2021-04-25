class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name
  attribute :email, if: :current_user
end
