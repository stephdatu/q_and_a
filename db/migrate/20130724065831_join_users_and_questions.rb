class JoinUsersAndQuestions < ActiveRecord::Migration
  def change
    create_table :discussions_users, id: false do |t|
      t.references :user
      t.references :discussion
    end
  end
end
