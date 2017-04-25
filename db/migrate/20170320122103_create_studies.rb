class CreateStudies < ActiveRecord::Migration[5.0]
  def change
    create_table :studies do |t|
      t.references :school, foreign_key: true
      t.references :persona, foreign_key: true
      t.string :titulo
      t.date :inicio
      t.date :fin

      t.timestamps
    end
  end
end
