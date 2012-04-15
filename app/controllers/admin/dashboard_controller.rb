class Admin::DashboardController < ApplicationController
   before_filter :authenticate_user!
   before_filter :get_details
  layout 'admin'
  def index
    @comments = Comment.limit(5).order("created_at DESC")
    @article_feedbacks = Article.limit(10).order("feedback_yes DESC")
  end

      protected

  def get_details
    ## method used to get required details in the layout sections and corresponding pages.
   @articles_count = Article.count
   @users_count = User.count
  end
end
