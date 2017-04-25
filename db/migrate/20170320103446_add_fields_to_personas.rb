class AddFieldsToPersonas < ActiveRecord::Migration[5.0]
  def change
    add_column :personas, :segundo_nombre, :string
    add_column :personas, :telefono_fijo, :string
    add_column :personas, :telefono_celular, :string
    add_column :personas, :sexo, :boolean
    add_column :personas, :edo_civil, :string
    add_column :personas, :facebook, :string
    add_column :personas, :twitter, :string
    add_column :personas, :instagram, :string
    add_column :personas, :github, :string
    add_column :personas, :linkedin, :string
    add_column :personas, :profesion, :string
    add_column :personas, :padre, :string
    add_column :personas, :madre, :string
    add_column :personas, :fecha_nac, :string
  end
end
