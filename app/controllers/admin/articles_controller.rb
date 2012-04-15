class Admin::ArticlesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_details
  layout 'admin'
  # GET /admin/articles
  # GET /admin/articles.xml
  def index
    @articles = Article.paginate(:all,:page =>page, :per_page =>per_page , :order =>"created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /admin/articles/1
  # GET /admin/articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /admin/articles/new
  # GET /admin/articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /admin/articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /admin/articles
  # POST /admin/articles.xml
  def create
    @article = Article.new(params[:article])
    @article.category = "Rails"
    respond_to do |format|
      if @article.save
        format.html { redirect_to(admin_article_path(@article), :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/articles/1
  # PUT /admin/articles/1.xml
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(admin_article_path(@article), :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  def manage_comment_status
    comment = Comment.find(params[:id])
     comment.toggle! :status
    redirect_to :back
    flash[:success] = "Status changed Succesfully"
  end

  def manage_article_status
    article = Article.find(params[:id])
     article.toggle! :status
    redirect_to :back
    flash[:success] = "Status changed Succesfully"
  end

  def search
    @articles = Article.search_articles(params[:search]).paginate(:all,:page =>page, :per_page =>per_page , :order =>"created_at DESC")
  end

  # DELETE /admin/articles/1
  # DELETE /admin/articles/1.xml
=begin
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(admin_articles_url) }
      format.xml  { head :ok }
    end
  end
=end

    protected

  def get_details
    ## method used to get required details in the layout sections and corresponding pages.
    @recent = Article.select("id,title").limit(5).order("created_at DESC")
  end
end
