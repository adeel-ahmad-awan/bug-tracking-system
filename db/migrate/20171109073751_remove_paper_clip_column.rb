class RemovePaperClipColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :bugs, :snapshot_file_name
    remove_column :bugs, :snapshot_content_type
    remove_column :bugs, :snapshot_file_size
    remove_column :bugs, :snapshot_updated_at
  end
end
