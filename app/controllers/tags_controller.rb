class TagsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: Tag.tokens(params[:q]) }
    end
  end
end
