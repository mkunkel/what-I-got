class User < ActiveRecord::Base
  # before_action :authenticate_user!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  validates :username, uniqueness: true, format: { with: /\A[a-zA-z0-9]+\z/, message: "username can only contain letters and numbers" }
  validates_presence_of :email

  def to_param
    username
  end


  def self.find_for_database_authentication(conditions={})
    self.where("username = ?", conditions[:email]).limit(1).first ||
    self.where("email = ?", conditions[:email]).limit(1).first
  end
end
