class AddUserIdToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :user_id, :integer
    add_index :responses, :user_id
  end
end
