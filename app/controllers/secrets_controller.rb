class SecretsController < ApplicationController

  before_action do
    authorize_api_application!
  end


  def index
    @secrets = Secret.all.includes(:user).order("created_at desc").first(20)
  end

  def create
    @secret = Secret.new params.require(:secret).permit(:comment, :user_id, :title, :created_at)
      if @secret.save
        render :index, status: 201
      else
        render json: @secret.errors, status: 422
      end
  end





end
