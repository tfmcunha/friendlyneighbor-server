class UpdateAllFks < ActiveRecord::Migration[5.2]
  def change
  	remove_foreign_key :messages, :conversations
  	remove_foreign_key :messages, :users
  	remove_foreign_key :volunteers, :requests
  	remove_foreign_key :volunteers, :users
    add_foreign_key :messages, :conversations, on_delete: :cascade
    add_foreign_key :messages, :users, on_delete: :cascade
    add_foreign_key :volunteers, :requests, on_delete: :cascade
    add_foreign_key :volunteers, :users, on_delete: :cascade
  end
end
