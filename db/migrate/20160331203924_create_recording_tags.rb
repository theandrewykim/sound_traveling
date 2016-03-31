class CreateRecordingTags < ActiveRecord::Migration
  def change
    create_table :recording_tags do |t|

      t.references :tag, null: false, index: true
      t.references :recording, null: false, index: true

      t.timestamps null: false
    end
  end
end
