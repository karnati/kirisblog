class ApplicationController < ActionController::Base
  protect_from_forgery

    def per_page
    if params[:per_page]
      @per_page = params[:per_page]
    else
      @per_page = 10
    end
  end

  def page
    if params[:page]
      @page = params[:page]
    else
      @page=1
    end
  end

  private

  def month_details
    # @articles_by_month = Article.find(:all).group_by { |post| post.created_at.strftime("%B") }
     @articles_by_year  = Article.where(:status => true).group_by { |post| post.created_at.strftime("%Y") }
  end

  def recent_articles
    @recent_articles = Article.select("id,title").where(:status => true).limit(5).order("created_at DESC").all
  end

end
