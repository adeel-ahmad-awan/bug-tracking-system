class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.string :body
      t.references :bug, foreign_key: true

      t.timestamps
    end
  end
end
