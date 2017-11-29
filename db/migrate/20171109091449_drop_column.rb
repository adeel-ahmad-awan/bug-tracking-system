class DropColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :pictures, :image
  end
end
