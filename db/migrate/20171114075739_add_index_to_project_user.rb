class AddIndexToProjectUser < ActiveRecord::Migration[5.0]
  def change
    add_index :userprojects, [:user_id, :project_id], :unique => true
  end
end
