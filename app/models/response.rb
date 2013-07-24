class Response < ActiveRecord::Base
  belongs_to :discussion
  has_and_belongs_to_many :users
  attr_accessible :answer

  validates :answer, presence: true
end
