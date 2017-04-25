class Persona < ApplicationRecord
  validates_presence_of :email
  #Empresas/Cargos
  has_many :cargos, inverse_of: :persona
  has_many :empresas,through: :cargos
  belongs_to :user, optional: true
  accepts_nested_attributes_for :cargos, :allow_destroy => true
  accepts_nested_attributes_for :empresas
  #Schools/Studies
  has_many :studies, inverse_of: :persona
  has_many :schools, through: :studies
  accepts_nested_attributes_for :studies, :allow_destroy => true
  accepts_nested_attributes_for :schools
  #Academies/Courses
  has_many :courses, inverse_of: :persona
  has_many :academies, through: :courses
  accepts_nested_attributes_for :courses, :allow_destroy => true
  accepts_nested_attributes_for :academies
  #Hobbies (1 to many)
  has_many :hobbies, :dependent => :destroy
  accepts_nested_attributes_for :hobbies, :allow_destroy => true

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end

  def nombre_completo
   self.nombre+" "+self.segundo_nombre+" "+self.apellido
  end

  def sexo_string
    self.sexo="M" ? "Masculino" : "Femenino"
  end

  def edo_civil_string
    a=["Soltero","Casado","Viudo","Divorciado"]
    return a[self.edo_civil.to_i]
  end
end
