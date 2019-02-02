class SessionsController < ApplicationController
  def new
    debugger
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid Creds you aint coming in lol"]
      redirect_to new_session_url
    end
  end
end
