class User < ApplicationRecord
  after_create :build_persona
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :persona



  def build_persona
    self.create_persona(:email=>self.email)
  end

end
