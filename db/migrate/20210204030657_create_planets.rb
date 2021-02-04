class CreatePlanets < ActiveRecord::Migration[6.1]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :climate
      t.integer :diamater
      t.string :gravity
      t.integer :orbital_period
      t.integer :population
      t.string :terrain
      t.timestamps
    end
  end

  def down
    drop_table :planets
  end
end
