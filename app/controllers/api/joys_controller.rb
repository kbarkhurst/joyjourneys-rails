class Api::JoysController < ApplicationController
  def index
    if params[:keyword_search] && params[:user_id]
      @pagy, @joys = pagy(Joy.where("body ILIKE ? AND user_id = ?", "%" + params[:keyword_search] + "%", params[:user_id]), page: params[:page], items: 30)
    elsif params[:keyword_search]
      @pagy, @joys = pagy(Joy.where("body ILIKE ?", "%" + params[:keyword_search] + "%"), page: params[:page],items: 30) 
    else
      @pagy, @joys = pagy(Joy.all, items: 30, page: params[:page]) #otherwise loads too long Joy.all.limit(30)
    end
    if @joys.length > 0
      @joydata = @joys.map do |joy|
        j = { id: joy.id,
        body: joy.body,
        visibility: joy.visibility,
        user_id: joy.user_id,
        username: joy.user.username,
        created_at: joy.created_at,
        updated_at: joy.updated_at,
        }
        j[:parents] = joy.parents.map do |parent|
          par = {id: parent.id,
          body: parent.body,
          visibility: parent.visibility,
          user_id: parent.user_id,  
          username: parent.user.username,
          created_at: parent.created_at,
          updated_at: parent.updated_at}
        end
        j[:inspireds] = joy.inspireds.map do |inspired|
          insp = {id: inspired.id,
            body: inspired.body,
            visibility: inspired.visibility,
            user_id: inspired.user_id,
            username: inspired.user.username,
            created_at: inspired.created_at,
            updated_at: inspired.updated_at}
        end
        j
      end
      render :json => { joys: @joydata, pagy: @pagy }
      # render "index.json.jb"
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
