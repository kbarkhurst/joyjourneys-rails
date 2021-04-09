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
    @joys = Joy.new(
      body: params[:body],
      visibility: params[:visibility],
    )
    if @joys.save
      render "index.json.jb"
    else
      render json: { message: "Didn't Work" }
    end
  end

  def update
    joy_id = params[:id]
    @joy = Joy.find_by(id: joy_id)

    @joy.body = params[:body] || @joy.body
    @joy.visibility = params[:visibility] || @joy.visibility

    @joy.save
  end
end
