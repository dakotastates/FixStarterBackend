class Proposal < ApplicationRecord
  belongs_to :problem
  belongs_to :user
  has_many :proposal_resources
  has_many :resources, through: :proposal_resources
  # has_one :project
end
