class JoinUsersAndAnswers < ActiveRecord::Migration
  def change
    create_table :users_answers, id: false do |t|
      t.references :user
      t.references :answer
    end
  end
end
