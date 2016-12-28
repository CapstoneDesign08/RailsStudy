class CreateHongs < ActiveRecord::Migration
  def change
    create_table :hongs do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
