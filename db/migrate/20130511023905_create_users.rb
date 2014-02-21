class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
<<<<<<< HEAD
                t.column :screen_name, :string
=======
          t.column :screen_name, :string
>>>>>>> 14e5f790dcfbf1a15f9466e2dc203cb282c925eb
	        t.column :email, :string
	        t.column :password, :string	
      t.timestamps
    end
  end
end
