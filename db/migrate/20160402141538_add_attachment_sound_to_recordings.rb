class AddAttachmentSoundToRecordings < ActiveRecord::Migration
  def self.up
    change_table :recordings do |t|
      t.attachment :sound
    end
  end

  def self.down
    remove_attachment :recordings, :sound
  end
end
