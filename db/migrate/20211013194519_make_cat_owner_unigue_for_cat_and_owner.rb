class MakeCatOwnerUnigueForCatAndOwner < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        # Remove and re-add the users email index to remove the uniqueness constraint
        remove_index :cat_owners, %i[cat_id owner_id]
        add_index :cat_owners, %i[cat_id owner_id], unique: true
      end

      dir.down do
        add_index :cat_owners, %i[cat_id owner_id]
        remove_index :cat_owners, %i[cat_id owner_id]
      end
    end
  end
end
