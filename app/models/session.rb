class Session < ActiveRecord::Base
  attr_accessible :question

  validates :question, presence: true
end
