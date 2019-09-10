# frozen_string_literal: true

# Create the owners db table
class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :name
      t.boolean :actually_a_catgirl
      t.integer :location

      t.timestamps

      t.index :actually_a_catgirl
      t.index :location
    end
  end
end
