class CreateContratos < ActiveRecord::Migration[5.0]
  def change
    create_table :contratos do |t|
      t.references :user, foreign_key: true
      t.references :servicio, foreign_key: true
      t.date :inicio
      t.date :fin

      t.timestamps
    end
  end
end
