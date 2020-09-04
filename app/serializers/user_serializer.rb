class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :firstName, :lastName, :avatar, :bio
end
