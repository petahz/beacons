class AddImageToConnections < ActiveRecord::Migration
  def change
    add_column :connections, :image, :string
  end
end
