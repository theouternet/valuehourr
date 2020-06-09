class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.integer :user_id
      t.integer :location_id
      t.integer :drink_id
      t.string :zip
      t.string :size
      t.integer :price
      t.string :when_available
      t.string :menu_link

      
      t.timestamps
    end
  end
end
