class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :omniauth_uid
      t.string :omniauth_provider
      
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
