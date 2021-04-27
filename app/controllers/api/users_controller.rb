class Api::UsersController < ApplicationController
  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user_id = params[:id]
    @user = User.find(user_id)
    render "show.json.jb"
    # if current_user
      # render "show.json.jb"
    # else
    #   render json: { errors: current_user.errors.full_messages }, status: :bad_request
    # end
  end
end
