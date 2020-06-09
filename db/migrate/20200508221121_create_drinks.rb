class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :type
      t.string :sub_type


      t.timestamps
    end
  end
end
