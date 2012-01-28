class Comment < ActiveRecord::Base
  belongs_to :article

  validates :name, :email, :description, :presence => true
end
