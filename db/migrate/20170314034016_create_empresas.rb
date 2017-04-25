class CreateEmpresas < ActiveRecord::Migration[5.0]
  def change
    create_table :empresas do |t|
      t.string :nombre
      t.text :direccion

      t.timestamps
    end
  end
end
