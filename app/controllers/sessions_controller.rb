class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @users = User.all
  end

  def create
    authenticate_user(params[:user_id])
    redirect_to current_user
  end
end
