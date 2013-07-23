class Session < ActiveRecord::Base
  attr_accessible :question
  has_many :responses

  validates :question, presence: true
end
