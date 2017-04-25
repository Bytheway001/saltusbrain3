class Empresa < ApplicationRecord
  has_many :cargos, dependent: :destroy
  has_many :personas, through: :cargos
end
