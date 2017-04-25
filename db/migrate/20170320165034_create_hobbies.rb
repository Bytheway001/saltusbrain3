class CreateHobbies < ActiveRecord::Migration[5.0]
  def change
    create_table :hobbies do |t|
      t.string :nombre
      t.references :persona, foreign_key: true

      t.timestamps
    end
  end
end
