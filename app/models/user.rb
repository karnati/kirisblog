class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me ,:first_name, :last_name, :username, :status

  def self.search_users(query)
    where("first_name LIKE ? or username LIKE ?  or email LIKE ?", "%#{query}%","%#{query}%" ,"%#{query}%")
  end
end
