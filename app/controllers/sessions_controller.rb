class SessionsController < ApplicationController
   def new
    
  end
  
  def create
   puts "the params are #{params}"
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error]= 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    puts "in destroy method"
    sign_out  
    redirect_to root_url
  end
end
