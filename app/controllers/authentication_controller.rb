class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { token: command.result, user: UserSerializer.new(User.find_by_email(params[:email])) }
    else
      render json: { error: command.errors.full_messages }, status: :unauthorized
    end
  end
end