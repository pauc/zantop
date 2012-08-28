class TagsController < ApplicationController
  def index
    @tags = Tag.with_translations(I18n.locale)

    respond_to do |format|
      format.html
      format.json { render json: @tags.where("name ilike ?", "%#{params[:q]}%") }
    end
  end
end
