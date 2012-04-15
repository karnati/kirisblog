class Admin::UsersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :get_details
  layout 'admin'

  def index
    @users = User.paginate(:all,:page =>page, :per_page =>per_page , :order =>"created_at DESC")
  end

  def show
    @user = User.find(params[:id])
  end
   def search
    @users = User.search_users(params[:search]).paginate(:all,:page =>page, :per_page =>per_page , :order =>"created_at DESC")
  end

  def manage_status
    user = User.find(params[:id])
    user.toggle! :status
    redirect_to :back
    flash[:success] = "Status changed Succesfully"
  end

  protected

  def get_details
    ## method used to get required details in the layout sections and corresponding pages.
    @recent = User.select("id,email").limit(5).order("created_at DESC")
  end
end
