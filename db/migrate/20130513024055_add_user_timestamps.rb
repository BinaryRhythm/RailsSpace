class AddUserTimestamps < ActiveRecord::Migration
  def up
      add_column :users, :create_on, :timestamp
      add_column :users, :update_on, :timestamp
  end

  def down
	  remove_column :users, :create_on
	  remove_column :users, :update_on
  end
end
