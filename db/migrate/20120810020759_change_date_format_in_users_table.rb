class ChangeDateFormatInUsersTable < ActiveRecord::Migration
  def up
    change_column :users, :birthdate, :date
  end

  def down
    change_column :users, :birthdate, :timestamp
  end
end
