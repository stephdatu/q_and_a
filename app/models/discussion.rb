class Discussion < ActiveRecord::Base
  attr_accessible :question
  has_many :responses, dependent: :delete_all
  has_and_belongs_to_many :users

  validates :question, presence: true
end
