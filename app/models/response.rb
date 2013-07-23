class Response < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :user
  attr_accessible :answer

  validates :answer, presence: true
end
