class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: UserSerializer.new(@users).serialized_json
  end

  # GET /users/1
  def show
    render json: UserSerializer.new(@user).serialized_json
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      token = AuthenticateUser.call(@user.email, @user.password).result
      render json: { message: "Account created succesfully!", 
                     token: token, 
                     user: UserSerializer.new(@user) }, 
                     status: :created
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: { message: "Account updated succesfully!" }, status: :ok
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    if @user
      @user.destroy
      render json: { message: "Account deleted succesfully!" }, status: :ok
    else
      render json: { message: "Unable to delete account!" }, status: :bad_request
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
