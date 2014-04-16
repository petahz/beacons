class AddStatusToConnections < ActiveRecord::Migration
  def change
  	add_column :connections, :status, :string, default: "active"
  end
end
