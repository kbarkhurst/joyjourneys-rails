class Api::JoysController < ApplicationController
  def index
    # if two params
    #   @joys = Joy.where("body ILIKE ? AND user_id = ?", "%" + params[:keyword_search] + "user_id")
    #   # Recipe.where("chef LIKE ? AND prep_time = ?", "%Ray%", 10)
    # end
    if params[:keyword_search]
      # @joys = Joy.where("body ILIKE ? AND user_id = ?", "%" + params[:keyword_search] + "%", user_id)
      @joys = Joy.where("body ILIKE ?", "%" + params[:keyword_search] + "%") 
    else
      @joys = Joy.all.limit(30) #otherwise loads too long
    end
    if @joys.length > 0
      render "index.json.jb"
    else
      render json: {message: "There are no search results" } 
    end
  end

  def show
    joy_id = params[:id]
    @joy = Joy.find(joy_id)
    render "show.json.jb"
  end

  def create
    if params[:parent_id]
      @joy = Joy.new(
        body: params[:body],
        visibility: params[:visibility],
        user_id: current_user.id,
      )
      
      if @joy.save
        puts "joy saved"
        puts  @joy.id
        puts params[:parent_id]
        Relationship.create!([
              inspired_id: @joy.id,
              parent_id: params[:parent_id],]
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

  # def keyword_search
  #   @joys = Joy.where("body ILIKE ?", "%" + keyword + "%")
  #   render "index.json.jb"
  # end
end
