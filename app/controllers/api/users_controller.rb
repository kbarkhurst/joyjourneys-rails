class Api::UsersController < ApplicationController
  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
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
    if params[:id]
      user_id = params[:id]
      @user = User.find(user_id)
    elsif params[:username]
      username = params[:username]
      @user = User.find_by(username: params[:username])
    end
    render "show.json.jb"
    # if current_user
      # render "show.json.jb"
    # else
    #   render json: { errors: current_user.errors.full_messages }, status: :bad_request
    # end
  end
end
