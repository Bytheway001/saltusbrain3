class School < ApplicationRecord
  has_many :studies, dependent: :destroy
  has_many :personas, through: :studies
end
