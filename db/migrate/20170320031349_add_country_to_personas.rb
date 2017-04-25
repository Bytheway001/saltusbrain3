class AddCountryToPersonas < ActiveRecord::Migration[5.0]
  def change
    add_column :personas, :country, :string
  end
end
