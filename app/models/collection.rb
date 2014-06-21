class Collection < ActiveRecord::Base

  belongs_to :user
  # has_one :user
  has_many :books

  validates :user_id, presence: true
end
