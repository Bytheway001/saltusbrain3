class CreateCargos < ActiveRecord::Migration[5.0]
  def change
    create_table :cargos do |t|
      t.references :persona, foreign_key: true
      t.references :empresa, foreign_key: true
      t.string :nombre
      t.date :inicio
      t.date :fin

      t.timestamps
    end
  end
end
