class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :books
  has_many :albums

  validates :user_id, presence: true
end
