class Subscriber < ActiveRecord::Base
  validates :email, :presence => true, :length => {:minimum => 5, :maximum => 50}, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

    def self.search_subscribers(query)
    where("email LIKE ? ", "%#{query}%" )
  end
end
