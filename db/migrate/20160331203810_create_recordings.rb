class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.string :title, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.text  :description

      t.references :user

      t.timestamps null: false
    end
  end
end
