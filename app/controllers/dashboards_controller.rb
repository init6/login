class DashboardsController < ApplicationController
  before_action :authorize_user!

  def show
    @user = session[:signed_in_user]
  end

  private

  def authorize_user!
    return true if session[:signed_in_user]
    redirect_to :new_session, flash: {error: "signing in required"}
  end
end
