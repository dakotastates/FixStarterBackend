class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :problemTitle, :description, :created_at, :longitude, :latitude, :proposals, :user, :status
end
