class Problem < ApplicationRecord
  belongs_to :user
  has_many :proposals
  has_many :categories
end
