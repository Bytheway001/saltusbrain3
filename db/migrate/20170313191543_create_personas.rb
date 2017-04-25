class CreatePersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :personas do |t|
      t.string :nombre
      t.string :apellido
      t.string :email
      t.string :direccion
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
