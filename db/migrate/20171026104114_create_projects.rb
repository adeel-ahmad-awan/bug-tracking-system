class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :bugs_num, default: 0

      t.timestamps
    end
  end
end
