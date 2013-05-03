class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "You successfully loged in!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    puts "in destroy method"
    sign_out
    redirect_to root_url
  end
  
end
