class Admin::FlashGamesController < ApplicationController
   before_filter :authenticate_user!
  layout 'admin'
  # GET /admin/flash_games
  # GET /admin/flash_games.xml
  def index
    @admin_flash_games = Admin::FlashGame.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_flash_games }
    end
  end

  # GET /admin/flash_games/1
  # GET /admin/flash_games/1.xml
  def show
    @admin_flash_game = Admin::FlashGame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin_flash_game }
    end
  end

  # GET /admin/flash_games/new
  # GET /admin/flash_games/new.xml
  def new
    @admin_flash_game = Admin::FlashGame.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_flash_game }
    end
  end

  # GET /admin/flash_games/1/edit
  def edit
    @admin_flash_game = Admin::FlashGame.find(params[:id])
  end

  # POST /admin/flash_games
  # POST /admin/flash_games.xml
  def create
    @admin_flash_game = Admin::FlashGame.new(params[:admin_flash_game])

    respond_to do |format|
      if @admin_flash_game.save
        format.html { redirect_to(@admin_flash_game, :notice => 'Flash game was successfully created.') }
        format.xml  { render :xml => @admin_flash_game, :status => :created, :location => @admin_flash_game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_flash_game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/flash_games/1
  # PUT /admin/flash_games/1.xml
  def update
    @admin_flash_game = Admin::FlashGame.find(params[:id])

    respond_to do |format|
      if @admin_flash_game.update_attributes(params[:admin_flash_game])
        format.html { redirect_to(@admin_flash_game, :notice => 'Flash game was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_flash_game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/flash_games/1
  # DELETE /admin/flash_games/1.xml
  def destroy
    @admin_flash_game = Admin::FlashGame.find(params[:id])
    @admin_flash_game.destroy

    respond_to do |format|
      format.html { redirect_to(admin_flash_games_url) }
      format.xml  { head :ok }
    end
  end
end
