class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :birth_year
      t.string :eye_color
      t.string :gender
      t.string :hair_color
      t.string :skin_color
      t.string :mass
      t.string :height
      t.references :planet, index:true, foreign_key: {to_table: :planets}
      t.references :starship, index:true, foreign_key: {to_table: :starships}
      t.timestamps
    end
  end
  
  def down
    drop_table :people
  end
end
