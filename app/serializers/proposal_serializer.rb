class ProposalSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :created_at, :problem
end
