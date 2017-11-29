class RemoveColumsFromBugs < ActiveRecord::Migration[5.0]
  def change
    remove_column :bugs, :reported_by
  end
end
