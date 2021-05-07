class Api::JoysController < ApplicationController
  def index
    if params[:year] && params[:keyword_search]
      @pagy, @joys = pagy(Joy.where("body ILIKE ? AND user_id = ? AND EXTRACT(YEAR FROM created_at) = ?", "%" + params[:keyword_search] + "%", params[:user_id], params[:year]), page: params[:page], items: 30)
    elsif params[:year]
      @pagy, @joys = pagy(Joy.where("user_id = ? AND EXTRACT(YEAR FROM created_at) = ?", params[:user_id], params[:year]), page: params[:page], items: 30)
    elsif params[:keyword_search] && params[:user_id]
      @pagy, @joys = pagy(Joy.where("body ILIKE ? AND user_id = ?", "%" + params[:keyword_search] + "%", params[:user_id]), page: params[:page], items: 30)
    elsif params[:visibility] == "true" && params[:keyword_search]
      @pagy, @joys = pagy(Joy.where("body ILIKE ? AND visibility = ?", "%" + params[:keyword_search] + "%",true), page: params[:page], items: 30)
    elsif params[:keyword_search]
      @pagy, @joys = pagy(Joy.where("body ILIKE ?", "%" + params[:keyword_search] + "%"), page: params[:page],items: 30) 
    else
      @pagy, @joys = pagy(Joy.all, items: 30, page: params[:page])
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
        render json: { error: @joy.errors.full_messages }, status: 406
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
        render json: { error: @joy.errors.full_messages }, status: 406
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

  def viewbyyear 
    @years = Joy.all.where("user_id = ?", params[:user_id]).map(&:created_at).map(&:year).uniq

    render :json => { years: @years }
    # Joy.find_by(:all, :conditions =>["year(created_at) BETWEEN ? AND ? ", '2018-01-01','2018-12-31'])
    # Joy.find_by(:all, :conditions =>["date(created_at) BETWEEN ? AND ? ", '2015-01-01','2018-12-31'])
    # Joy.where(created_at: 2018.all_day)
  end
  # def keyword_search
  #   @joys = Joy.where("body ILIKE ?", "%" + keyword + "%")
  #   render "index.json.jb"
  # end
end
