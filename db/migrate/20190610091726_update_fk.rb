class UpdateFk < ActiveRecord::Migration[5.2]
  def change
  	remove_foreign_key :conversations, :requests
    add_foreign_key :conversations, :requests, on_delete: :cascade
  end
end
