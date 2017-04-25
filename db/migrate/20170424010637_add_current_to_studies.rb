class AddCurrentToStudies < ActiveRecord::Migration[5.0]
  def change
    add_column :studies, :current, :boolean
    add_column :courses, :current, :boolean
  end
end
