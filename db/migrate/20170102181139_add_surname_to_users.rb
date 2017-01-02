class AddSurnameToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :surname, :string # add a new column to table "users", called "surname" and of type "string"
  	add_index :users, :surname # first, index surname for quick lookup.
  end
end
