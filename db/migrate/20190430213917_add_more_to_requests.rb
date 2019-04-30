class AddMoreToRequests < ActiveRecord::Migration[5.2]
  def change
  	add_column :requests, :type, :binary
    add_column :requests, :fulfilled, :boolean
    add_column :requests, :lat, :float
    add_column :requests, :lgt, :float
  end
end
