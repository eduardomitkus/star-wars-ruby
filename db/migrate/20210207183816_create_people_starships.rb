class CreatePeopleStarships < ActiveRecord::Migration[6.1]
  def change
    create_table :people_starships do |t|
      t.references :pilot, index:true, foreign_key: {to_table: :people}
      t.references :starship, index:true, foreign_key: {to_table: :starships}
      t.timestamps
    end
  end
end
