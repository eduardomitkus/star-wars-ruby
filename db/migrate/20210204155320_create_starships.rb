class CreateStarships < ActiveRecord::Migration[6.1]
  def change
    create_table :starships do |t|
      t.string :name
      t.string :model
      t.string :manufacturer
      t.string :max_atmosphering_speed
      t.integer :passengers
      t.references :pilot, index:true, foreign_key: {to_table: :people}
      t.timestamps
    end
  end
  
  def down
    drop_table :starships
  end
end


