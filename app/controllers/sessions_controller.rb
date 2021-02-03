class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: permtted_params[:email])
    if @user && @user.password == permtted_params[:password]
      session[:signed_in_user] = @user
      return redirect_to :dashboard
    else
      return redirect_to :new_session, flash: {error: "wrong Email or Password"}
    end
  end

  private

  def permtted_params
    params.require(:user).permit(:email, :password)
  end
end
