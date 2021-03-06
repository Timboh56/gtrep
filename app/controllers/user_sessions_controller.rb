class UserSessionsController < ApplicationController  
  respond_to :xml, :html, :json
  skip_before_filter :check_activated, :only => [:destroy]
 
  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    @user_session = UserSession.new
  end
 
  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    
    @user_session = UserSession.new(params[:user_session])
    
    respond_with(@user_session) do |format|
      if @user_session.save
        format.html { redirect_to(:users, :notice => 'Login Successful') }
        format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end

  end
 
  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    current_user_session.destroy 
    respond_to do |format|
      format.html { redirect_to new_user_session_path }
      format.xml  { head :ok }
    end
  end
end