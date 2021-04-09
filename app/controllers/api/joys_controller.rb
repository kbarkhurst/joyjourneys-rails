class Api::JoysController < ApplicationController
  def index
    @joys = Joy.all
    render "index.json.jb"
  end

  def show
    joy_id = params[:id]
    @joy = Joy.find(joy_id)
    render "show.json.jb"
  end

  def create
    @joy = Joy.new(
      body: params[:body],
      visibility: params[:visibility],
      user_id: current_user.id,
    )
    if @joy.save
      render "show.json.jb"
    else
      render json: { error: @joy.errors.full_messages }
    end
  end

  def update
    joy_id = params[:id]
    @joy = Joy.find_by(id: joy_id)

    @joy.body = params[:body] || @joy.body
    @joy.visibility = params[:visibility] || @joy.visibility
    @joy.user_id = params[:user_id] || @joy.user_id ##only for testing/building

    if @joy.save
      render "show.json.jb"
    else
      render json: { error: @joy.errors.full_messages }
    end
  end
end
