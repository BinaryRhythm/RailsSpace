class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.column :user_id, :integer,:null => false
      t.column :comments_id,:integer,:null => true
      t.column :state, :text
      t.column :good,:integer
      t.column :read_numbers,:integer
      t.column :republish_numbers,:integer
     t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end

end
