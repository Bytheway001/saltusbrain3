class Curriculumpdf < Prawn::Document
def initialize(curriculum,view)
  super()
  text "Esto es un curriculum"
end
end