class CreatePlaylistrecordings < ActiveRecord::Migration
  def change
    create_table :playlistrecordings do |t|
      t.references :recording, index: true, foreign_key: true
      t.references :playlist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
