class Contrato < ApplicationRecord
  belongs_to :user
  belongs_to :servicio
end
