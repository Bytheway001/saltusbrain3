  class Cargo < ApplicationRecord
    attr_accessor :enterprise

    after_find do |cargo|
      puts 'naming'
      empresa=Empresa.find(self.empresa_id)
      self.enterprise=empresa.nombre
    end
    after_initialize :validate_changes
    before_save :set_empresa

    belongs_to :persona
    belongs_to :empresa, optional: true

    def set_empresa
      empresa=Empresa.find_or_create_by(:nombre=>self.enterprise)
      self.empresa_id=empresa.id
    end

    def validate_changes
      if attribute_will_change! :enterprise
        puts "Cambiara"
      else
        puts "NO PASA UN CARAJO"
      end
    end
  end
