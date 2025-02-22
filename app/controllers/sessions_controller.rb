class SessionsController < ApplicationController

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to(users_home_path)
    else
      redirect_to(new_session_path)
    end
  end

end
