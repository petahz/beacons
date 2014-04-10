class AddUserNameAndRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :role, :string, default: 'hero'
  end
end
