class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def authorize_api_application!
    # @secret = Secret.find_by token: params[:token]
      if request.headers["x-api-key"] != "91d994652a17"
        render json: {status: "unauthorized"}, status: 401
        return false
      end

    end



 end
