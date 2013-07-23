class Response < ActiveRecord::Base
  belongs_to :discussion
  attr_accessible :answer

  validates :answer, presence: true
end
