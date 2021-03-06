class UsersController < ApplicationController
  filter_access_to :all
  caches_action :index
  respond_to :html, :xml, :json
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    
    respond_with(@user)
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @roles = Role.all

    respond_with(@user)
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @roles = Role.all
    
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.activated = false
    @user.salt = (0..8).map{(65 + rand(24)).chr}.join()
    
    if params[:user][:role_ids].nil?
      @user.role_ids = 3
    end
 
   respond_with(@user) do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver!
        format.html { render :action => "activate", :notice => "Please check your email to activate your account" }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @roles = Role.all
    

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
