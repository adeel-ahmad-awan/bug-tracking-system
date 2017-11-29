class AddAttachmentSnapshotToBugs < ActiveRecord::Migration
  def self.up
    change_table :bugs do |t|
      t.attachment :snapshot
    end
  end

  def self.down
    remove_attachment :bugs, :snapshot
  end
end
