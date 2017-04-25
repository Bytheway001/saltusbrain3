class Academy < ApplicationRecord
  has_many :courses, dependent: :destroy
  has_many :personas, through: :studies
end
