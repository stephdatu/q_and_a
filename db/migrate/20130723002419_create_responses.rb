class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :answer
      t.references :discussion

      t.timestamps
    end
    add_index :responses, :discussion_id
  end
end
