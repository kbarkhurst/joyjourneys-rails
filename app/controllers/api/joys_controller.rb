class Api::JoysController < ApplicationController
  def index
    if params[:keyword_search]
      @joys = Joy.where("body ILIKE ?", "%" + params[:keyword_search] + "%")
    else
      @joys = Joy.all.limit(30) #otherwise loads too long
      # @joys = Joy.all
    end
    #     # @joys = Joy.find_by(body: search)
    # @joys = Joy.search(params[:keyword_search])
    # @joys = Joy.all
    render "index.json.jb"
  end

  def show
    joy_id = params[:id]
    @joy = Joy.find(joy_id)
    render "show.json.jb"
  end

  def create
    if params[:inspirationfor_id]
      @joy = Joy.new(
        body: params[:body],
        visibility: params[:visibility],
        user_id: current_user.id,
      )
      
      if @joy.save
        puts "joy saved"
        puts  @joy.id
        puts params[:inspirationfor_id]
        Relationship.create!([
              inspiredby_id: @joy.id,
              inspirationfor_id: params[:inspirationfor_id],]
            )
        render "show.json.jb"
      else
        render json: { error: @joy.errors.full_messages }
      end
    else
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

  def keyword_search
    @joys = Joy.where("body ILIKE ?", "%" + keyword + "%")
    render "index.json.jb"
  end
end
