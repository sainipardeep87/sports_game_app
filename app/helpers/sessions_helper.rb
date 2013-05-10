module SessionsHelper
   def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user1 = user
  end
    
  def current_user1=(user)
    @current_user = user
  end
  
  def current_user1
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  
  def current_user1?(user)
    @current_user == user
  end
  
  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
    puts "the current user is"
  end
  
  def signed_in?
    !current_user1.nil?   
  end
  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end 

end
