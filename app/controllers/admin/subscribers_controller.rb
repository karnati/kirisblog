class Admin::SubscribersController < ApplicationController
    before_filter :authenticate_user!
  before_filter :get_details
  layout 'admin'

  def index
    @subscribers = Subscriber.paginate(:all,:page =>page, :per_page =>per_page , :order =>"created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subscribers }
    end
  end

    def search
      @subscribers = Subscriber.search_subscribers(params[:search]).paginate(:all,:page =>page, :per_page =>per_page , :order =>"created_at DESC")
    end

    def manage_status
    subscriber = Subscriber.find(params[:id])
     subscriber.toggle! :status
    redirect_to :back
    flash[:success] = "Status changed Succesfully"
  end


      protected

  def get_details
    ## method used to get required details in the layout sections and corresponding pages.
    @recent = Subscriber.select("id,email").limit(5).order("created_at DESC")
  end
end
