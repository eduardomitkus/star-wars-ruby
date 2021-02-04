class CreateBreeds < ActiveRecord::Migration[6.1]
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :clasification
      t.string :designation
      t.string :language
      t.timestamps
    end
  end

  def down
    drop_table :breeds
  end
end
