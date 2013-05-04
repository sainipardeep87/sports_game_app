class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :index, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:destroy]
  # GET /users
  # GET /users.json
  def index
   @users=User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user=User.find(params[:id])
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    # respond_to do |format|
      # format.html # new.html.erb
      # format.json { render json: @user }
    # end
  end

  # GET /users/1/edit
  def edit
    
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
   end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    puts "params are #{params}"
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  
  private
  def admin_user
   redirect_to(root_path) unless current_user.admin?
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  
  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end 
 
end