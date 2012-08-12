class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password
      t.timestamp :birthdate
      t.string :location

      t.timestamps
    end
  end
end
