class SessionsController < ApplicationController
  skip_before_filter :authenticate_user

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user.present? && user.authenticate(params[:password])
      set_user_session(user)
      redirect_to root_path, notice: "Successfully logged in! Hello #{user.name}"
    else
      flash[:alert] = 'Username or password did not match'
      render :new
    end
  end

  def destroy
    session[:logged_in_users_id] = nil
    redirect_to root_path, notice: "Successfully logged out"
  end

  private

    def set_user_session(user)
      session[:logged_in_users_id] = user.id
    end
end
