class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.text :question

      t.timestamps
    end
  end
end
