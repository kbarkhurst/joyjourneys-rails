class Api::RelationshipsController < ApplicationController
  def index
    if params[:inspiredby_id]
      @relationships = Relationship.where(inspiredby_id: params[:inspiredby_id])
    elsif params[:inspirationfor_id]
      @relationships = Relationship.where(inspirationfor_id: params[:inspirationfor_id])
    else
      @relationships = Relationship.all
    end
    render "index.json.jb"
  end

  def create
    @relationship = Relationship.new(
      inspiredby_id: params[:inspiredby_id],
      inspirationfor_id: params[:inspirationfor_id],
    )
    if @relationship.save
      render "show.json.jb"
    else
      render json: { error: @relationship.errors.full_messages }
    end
  end
end
