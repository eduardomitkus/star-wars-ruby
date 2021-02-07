class CreateSpecies < ActiveRecord::Migration[6.1]
  def change
    create_table :species do |t|
      t.string :name
      t.string :classification
      t.string :designation
      t.string :language
      t.timestamps
    end
  end

  def down
    drop_table :species
  end
end
