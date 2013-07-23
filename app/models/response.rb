class Response < ActiveRecord::Base
  belongs_to :session
  attr_accessible :answer

  validates :answer, presence: true
end
