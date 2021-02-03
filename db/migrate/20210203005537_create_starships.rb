class CreateStarships < ActiveRecord::Migration[6.1]
  def change
    create_table :starships do |t|
      t.string :name
      t.string :model
      t.string :manufacturer
      t.string :max_atmosphering_speed
      t.integer :passengers
      t.timestamps
    end
  end

  def down
    drop_table :starships
  end
end
