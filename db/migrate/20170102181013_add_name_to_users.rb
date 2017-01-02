class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :name, :string # add a new column to table "users", called "name" and of type "string"
  	add_index :users, :name # first, index name for quick lookup.
  end
end
