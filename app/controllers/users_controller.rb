require "base64"

class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    redirect_to '/'
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    flash[:successEmail] = @user.email
    flash[:password] = @user.password
    flash[:userid] = @user.id

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:successEmail] = @user.email
        flash[:password] = @user.password
        format.html { redirect_to edit_user_path(@user), notice: 'Your info was saved. Here you can add your job info, or click done' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Info was successfully updated.' }
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
  
  def signup
    
  end
  
  def invite
    @userEmail = params[:signUpEmail]
    @existingEmails = User.where('email =?',@userEmail).count
    if @existingEmails == 0
      @url = "http://127.0.0.1:3000/verify?email="+@userEmail+"&encoded="
      @padded = @userEmail+"secret"
      @encoded   = Base64.encode64(@padded)
      @sendlink = @url+@encoded
      SignupMailer.signup_email(@userEmail,@sendlink).deliver
    end
  end
  
  def verify
    
    @fromEmail = params[:email]
    @encodedString = params[:encoded]
    @actualSalted = @fromEmail+"secret"
    @actualEncoded  = Base64.encode64(@actualSalted)
    
    
    
    if(@encodedString.strip == @actualEncoded.strip)
      flash[:successEmail] = @fromEmail
      redirect_to "/users/new"
    end
  
  
  end
  
  
  def homepage
    flash[:successEmail] =flash[:successEmail]
    flash[:password] = flash[:password]
    flash[:userid] = flash[:userid]
  end
  
  
end
