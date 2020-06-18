class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.integer :user_id
      t.integer :location_id
      t.string :drink_name
      t.string :drink_type
      t.string :drink_sub_type
      t.string :size
      t.integer :price
      t.string :when_available
      t.string :menu_link

      
      t.timestamps
    end
  end
end
