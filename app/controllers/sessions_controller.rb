class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email],
                                    params[:user][:password])
    if user
      login_user!(user)
      redirect_to bands_url
    else
      @user = User.new(params.require(:user).permit(:email))
      render :new
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
    end
    redirect_to new_user_url
  end
end
