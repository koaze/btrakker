class AddUsernameToUsers < ActiveRecord::Migration[5.0]
  def change # anything inside of this method, is translated to SQL code and modified the database (pg)
  	add_column :users, :username, :string # add a new column to table "users", called "username" and of type "string"
  	add_index :users, :username, unique: true # first, index username for quick lookup. Second ensure usernames are ALWAYS unique.
  end
end
