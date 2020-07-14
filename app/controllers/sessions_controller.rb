class SessionsController < ApplicationController

  def home
    #home page placeholder
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:name] == nil || params[:user][:name].empty?
      redirect_to signin_path
    else
      @user = User.find_by(name: params[:user][:name])

      if @user.authenticate(params[:password])
        session[:user_id] = current_user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path
      end
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
   
end
