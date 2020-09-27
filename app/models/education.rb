class Education < ApplicationRecord
  belongs_to :institution
  belongs_to :degree
  belongs_to :field
  belongs_to :user
end
