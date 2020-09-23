class Project < ApplicationRecord
  belongs_to :proposal
  belongs_to :user
  has_many :resources, through: :proposals
end
