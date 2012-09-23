class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    #email is our key for auth
    if user && user.authenticate(params[:session][:password])
      #auth function from secure password
      sign_in user
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
