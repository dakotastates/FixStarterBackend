class UserSerializer < ActiveModel::Serializer
  attributes :username, :firstName, :lastName, :avatar, :bio
end
