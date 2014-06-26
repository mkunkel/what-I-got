class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :books
  has_many :movies
  has_many :electronics

  validates :user_id, presence: true
end
