class AddFirstAndLastNameAndOtherDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :designation, :string
    add_column :users, :is_admin, :boolean, :default => false

  end
end
