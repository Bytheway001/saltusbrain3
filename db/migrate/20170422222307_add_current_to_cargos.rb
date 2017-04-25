class AddCurrentToCargos < ActiveRecord::Migration[5.0]
  def change
    add_column :cargos, :current, :boolean
  end
end
