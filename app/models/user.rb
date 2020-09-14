class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
  has_many :problems, dependent: :destroy
  has_many :proposals, dependent: :destroy
end
