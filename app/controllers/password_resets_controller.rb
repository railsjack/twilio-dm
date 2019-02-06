class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def show
    redirect_to edit_password_reset_path(params[:id], email: params[:email])
  end

  def edit
  end

  def create
    @user = User.find_by(email: params[:password_resets][:email])
    if @user
      if @user.activated?
        @user.create_reset_digest
        @user.send_password_reset_email
        flash[:info] = "Email sent with password reset instruction"
        redirect_to root_url
      else
        flash[:warning] = "The email needs to be activated first."
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif params[:user][:password_confirmation] != params[:user][:password]
      @user.errors.add(:password_confirmation, "should be matched")
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Password has been reset"
      redirect_to root_url
    else
      render 'edit', email: params[:email]
    end
  end

  private
  def get_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
