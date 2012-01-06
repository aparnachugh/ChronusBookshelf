class SessionsController < ApplicationController

  skip_before_filter :authorize

  def new
    @cart = current_cart
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
     session[:user_id] = user.id
     redirect_to admin_url
    else
      redirect_to login_url, :alert => "Invalid Username or Password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, :notice => "Logged Out"
  end

end
