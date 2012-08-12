class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.references :user

      t.timestamps
    end
    add_index :jobs, :user_id
  end
end
