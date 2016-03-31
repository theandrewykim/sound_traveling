class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|

      t.references :recording, null: false, index: true
      t.references :user, null: false, index: true

      t.timestamps null: false
    end
  end
end
