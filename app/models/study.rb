class Study < ApplicationRecord
  attr_accessor :escuela
  after_find do |study|
    school=School.find(self.school_id)
    self.escuela=school.nombre
  end
  after_initialize :validate_changes
  before_save :set_school

  belongs_to :persona
  belongs_to :school, optional: true

  def set_school
    school=School.find_or_create_by(:nombre=>self.escuela)
    self.school_id=school.id
  end

  def validate_changes
    if attribute_will_change! :escuela
      puts "Cambiara"
    else
      puts "NO PASA UN CARAJO"
    end
  end


end
