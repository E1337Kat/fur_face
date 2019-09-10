# frozen_string_literal: true

# Create the cat owners db table
class CreateCatOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_owners do |t|
      t.belongs_to :cat, index: true
      t.belongs_to :owner, index: true
      t.integer :cat_status
      t.integer :owner_status

      t.timestamps
    end
  end
end
