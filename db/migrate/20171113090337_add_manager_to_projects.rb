class AddManagerToProjects < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :manager, references: :users, index: true
    add_foreign_key :projects, :users, column: :manager_id
    # add_reference :posts, :author, references: :users, index: true
    # add_foreign_key :posts, :users, column: :author_id
  end
end
