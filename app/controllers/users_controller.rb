class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
   
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
  end
end