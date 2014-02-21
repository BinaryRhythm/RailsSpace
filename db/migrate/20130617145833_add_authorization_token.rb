class AddAuthorizationToken < ActiveRecord::Migration
  def up
    add_column :users,:authorization_token,:string
  end

  def down
    remove_column :users,:authorization_token
  end
end
