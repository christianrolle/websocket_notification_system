class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @users = User.by_name
  end

  def create
    authenticate_user(params[:user_id])
    redirect_to current_user
  end
end
