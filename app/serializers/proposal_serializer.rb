class ProposalSerializer < ActiveModel::Serializer
  attributes :id, :title, :descrition, :created_at
end
