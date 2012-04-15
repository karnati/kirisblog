class Article < ActiveRecord::Base
  has_many :comments
validates :title, :presence => true
validates :description, :presence => true


   #  search bar in articles
  def self.search_articles(query)
    where("title LIKE ? or description LIKE ? ", "%#{query}%","%#{query}%" )
  end
end
