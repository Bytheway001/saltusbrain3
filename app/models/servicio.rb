class Servicio < ApplicationRecord
	has_many :contratos

	def to_s
		self.nombre
	end

	def count_contratos
		self.contratos.count
	end
end
