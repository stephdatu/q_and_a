class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :answer
      t.references :session

      t.timestamps
    end
    add_index :responses, :session_id
  end
end
