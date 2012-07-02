class Admin::EnquiriesController < ApplicationController
    before_filter :authenticate_user!
  before_filter :get_details
  layout 'admin'

  def index
    @enquiries = Enquiry.paginate(:all,:page =>page, :per_page =>per_page , :order =>"created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @enquiries }
    end
  end

    def search
      @enquiries = Enquiry.search_enquiries(params[:search]).paginate(:all,:page =>page, :per_page =>per_page , :order =>"created_at DESC")
    end

    def show
      @enquiry =Enquiry.find(params[:id])
    end




      protected

  def get_details
    ## method used to get required details in the layout sections and corresponding pages.
    @recent = Enquiry.select("id,name").limit(5).order("created_at DESC")
  end

end
