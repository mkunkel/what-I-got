class Book < ActiveRecord::Base
  belongs_to :collection
  # has_many :collections
end
