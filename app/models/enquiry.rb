class Enquiry < ActiveRecord::Base
  validates :name , :presence => true, :length => {:minimum => 3, :maximum => 30}
  validates :email, :presence => true, :length => {:minimum => 5, :maximum => 50}, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  validates :description, :presence => true, :length => {:minimum => 3 }

      def self.search_enquiries(query)
    where("subject LIKE ? or   name LIKE ? or email LIKE ? ", "%#{query}%" , "%#{query}%" , "%#{query}%"  )
      end

end


