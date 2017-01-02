class AddStatusToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :status, :string # add a new column to table "users", called "status" and of type "string"
  	add_index :users, :status # first, index status for quick lookup.
  end
end
