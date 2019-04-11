class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.boolean :fluff_ears
      t.string :meow
      t.string :personality
      t.boolean :claws
      t.integer :fluff_type

      t.timestamps
    end
    add_index :cats, :fluff_type
  end
end
