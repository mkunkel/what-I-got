class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :books
  # belongs_to :book
  validates :user_id, presence: true
end
