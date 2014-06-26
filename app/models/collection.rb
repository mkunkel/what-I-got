class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :books, dependent: :destroy
  has_many :movie, dependent: :destroy
  has_many :electronics, dependent: :destroy
  has_many :albums, dependent: :destroy

  validates :user_id, presence: true
end
