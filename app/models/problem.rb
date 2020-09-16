class Problem < ApplicationRecord
  belongs_to :user
  has_many :proposals, dependent: :destroy
  has_many :categories
end
