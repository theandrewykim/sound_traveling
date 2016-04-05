class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.string :title, null: false
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :country
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.text  :description
      t.integer :type, default: 0, null: false

      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
