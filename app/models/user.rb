class User < ApplicationRecord
  after_create :build_persona
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :persona
  has_many :contratos
  accepts_nested_attributes_for :contratos, allow_destroy: true

  def build_persona
    self.create_persona(:email=>self.email)
  end

  def to_s
    self.nombre
  end

    def count_contratos
    self.contratos.count
  end
end
