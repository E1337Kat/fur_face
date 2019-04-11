class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :name
      t.boolean :actually_a_catgirl
      t.integer :location

      t.timestamps
    end
    add_index :owners, :actually_a_catgirl
    add_index :owners, :location
  end
end
