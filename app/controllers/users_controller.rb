class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
      puts @user
    else
      render json: {error: "Invalid "}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
      puts "THIS IS THE INFORMATION WE'RE LOOKING FOR!!!!!"
      puts @user
    else
      render json: {error: "Invalid username or password"}
    end
  end


  def auto_login
    puts @user
    render json: @user
  end

  private

  def user_params
    params.permit(:name, :password)
  end
end
