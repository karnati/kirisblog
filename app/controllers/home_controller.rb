class HomeController < ApplicationController
  layout 'layout'
   before_filter :month_details, :recent_articles
  def index
    @articles =Article.order("created_at DESC")
     @comment = Comment.new
  end

  def show
    @article = Article.find_by_title(params[:id])
    @comments = Comment.where(:article_id => @article.id)
    @comment = Comment.new
  end

 def create
    @comment = Comment.new(params[:comment])
     @article = Article.find_by_title(params[:title])
    @comments = Comment.where(:article_id => @article.id)
   @comment.article_id = @article.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(home_path(params[:title]), :notice => 'Comment posted successfully.') }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "show", :id => params[:title]}
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end


end
