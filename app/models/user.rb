class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  has_many :problems, dependent: :destroy
  has_many :proposals, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :educations
  has_many :degrees, through: :educations
  has_many :fields, through: :educations
  has_many :institutions, through: :educations
  has_many :comments
  has_many :messages
  has_many :problem_consultations
end
