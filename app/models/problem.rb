class Problem < ApplicationRecord
  belongs_to :user
  has_many :proposals, dependent: :destroy
  has_many :problem_categories
  has_many :categories, through: :problem_categories
end
