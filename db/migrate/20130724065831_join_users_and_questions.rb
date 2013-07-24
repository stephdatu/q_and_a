class JoinUsersAndQuestions < ActiveRecord::Migration
  def change
    create_table :users_questions, id: false do |t|
      t.references :user
      t.references :question
    end
  end
end
