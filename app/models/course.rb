class Course < ApplicationRecord
  attr_accessor :academia
  after_find do |course|
    academy=Academy.find(self.academy_id)
    self.academia=academy.nombre
  end
  after_initialize :validate_changes
  before_save :set_academy

  belongs_to :persona
  belongs_to :academy, optional: true

  def set_academy
    academy=Academy.find_or_create_by(:nombre=>self.academia)
    self.academy_id=academy.id
  end

  def validate_changes
    if attribute_will_change! :academia
      puts "Cambiara"
    else
      puts "NO PASA UN CARAJO"
    end
  end
end
