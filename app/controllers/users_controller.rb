class UsersController < ApplicationController

  # before_action do
  #   authorize_api_application!
  # end

  # before_action do
  #   authorize_current_user!
  # end


  # before_action :auth_user! except: [:new, :create]
  #
  # def auth_user!
  #   @user_id = session[:user_id]
  #   @current_user = User.find_by id: @user_id
  #
  #   if @current_user.nil?
  #     redirect_to login_path
  #   end
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(:name, :email, :password, :password_confirmation)
    @user.token = SecureRandom.hex(8)
    if @user.save
      render status: 201
    else
      render json: @user.errors, status: 422
    end
  end

  # def index
  #   @users = User.all.includes(:secrets)
  # end

end
