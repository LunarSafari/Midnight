class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.find_by(email: params[:email]).authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to account_path
    else
      alert 'Wrong password.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
