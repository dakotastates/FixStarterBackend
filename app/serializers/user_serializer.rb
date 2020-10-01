class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :firstName, :lastName, :avatar, :bio, :admin_level
end
