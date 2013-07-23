class Discussion < ActiveRecord::Base
  attr_accessible :question
  has_many :responses, dependent: :delete_all

  validates :question, presence: true
end
