class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    email = params[:email]
    password = params[:password]

    @user = User.find_by email: email
    if (@user) && (@user.authenticate password)
      render status: 201
      # session[:user_id] = user.id
      # @current_user = user
    else
      render json: {auth: "failed"}, status: 422
    end
  end



  # def create
  #
  # http_response = Http.post("http://localhost:3000/api/auth.json", json: {username: params[:username], password: params[:password]})
  #
  # if http_response.code == 200
  #   user = JSON.parse(http_response)
  #   session[:username] = user["username"]
  #   session[:token] = user["token"]
  #   redirect_to root_path
  # else
  #   flash.now[:alert] = "Auth failed Bro"
  #   render :new
  # end
  #
  #




  def destroy
    session.delete :user_id
    redirect_to login_path
  end

end
