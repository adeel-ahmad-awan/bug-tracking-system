class CreateBugs < ActiveRecord::Migration[5.0]
  def change
    create_table :bugs do |t|
      t.string :name
      t.string :reported_by
      t.string :priority
      t.text :description
      t.string :status
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
