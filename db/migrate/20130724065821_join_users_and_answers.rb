class JoinUsersAndAnswers < ActiveRecord::Migration
  def change
    create_table :responses_users, id: false do |t|
      t.references :user
      t.references :response
    end
  end
end
