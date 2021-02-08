class CreatePersonStarhips < ActiveRecord::Migration[6.1]
  def change
    create_table :person_starhips do |t|
      t.belongs_to :person
      t.belongs_to :starship
      t.timestamps
    end
  end

  def down
    drop_table :person_starhips
  end

end