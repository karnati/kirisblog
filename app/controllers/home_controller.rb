class HomeController < ApplicationController
  layout 'main_layout'
  before_filter :month_details, :recent_articles
  def index
    @articles =Article.where(:status => true).paginate(:all,:page =>page, :per_page =>per_page , :order =>"created_at DESC")
     @subsciber = Subscriber.new
    # @comment = Comment.new
  end

  def show
    @article = Article.find_by_title(params[:id])
    @comments = Comment.where(:article_id => @article.id, :status => true)
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



  def feedback

    @article = Article.find(params[:id])
    if params[:feedback] == "yes"
      @article.update_attribute(:feedback_yes, @article.feedback_yes + 1)
    else
      @article.update_attribute(:feedback_no, @article.feedback_no + 1)
    end
    respond_to do |format|
      format.js
    end
  end

  def enquiry_mail
    @enquiry = Enquiry.new(params[:enquiry])
    EnquiryMailer.enquiry_email(@enquiry).deliver
    respond_to do |format|
      if @enquiry.save
        format.html { redirect_to( :back , :notice => 'Email sent successfully.') }
        format.xml  { render :xml => @enquiry, :status => :created, :location => @enquiry }
      else
        format.html { render :action => "contact_me", :id => params[:title]}
        format.xml  { render :xml => @enquiry.errors, :status => :unprocessable_entity }
      end
    end
  end

  def search
    if params[:search].blank?
      redirect_to :back
      flash[:notice] = "Please type a keyword to search."
      return
    end
    @articles = Article.search_articles(params[:search]).where(:status => true).paginate(:all,:page =>page, :per_page =>per_page , :order =>"created_at DESC")
  end

  def create_subscriber
    @subscriber = Subscriber.new(params[:subscriber])

      if @subscriber.save
        redirect_to :back , :notice => 'Email sent successfully.'

      else
        redirect_to :back , :error => 'Email cant be blank.'

    end
  end

  def about_me

  end

  def contact_me
    @enquiry = Enquiry.new
  end

  def load_theme
   session[:theme]=params[:id]
  end


end