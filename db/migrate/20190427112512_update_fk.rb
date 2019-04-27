class UpdateFk < ActiveRecord::Migration[5.2]
  def change  	
    remove_foreign_key :requests, :users

    add_foreign_key :requests, :users, on_delete: :cascade
  end
end
