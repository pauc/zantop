class TagsController < ApplicationController
  respond_to :html
  include Authorization

  expose(:categories) { Tag.all }
  expose(:category) { Tag.find(params[:id]) }
  expose(:works) { tag.works.published }

  def index
    respond_to do |format|
      format.json { render json: Tag.tokens(params[:q]) }
    end
  end

  def show

  end

  def update
    I18n.available_locales.each do |locale|
      category.send("name_#{locale}=", params[:tag][:"name_#{locale}"]) if !params[:tag][:"name_#{locale}"].blank?
    end
    respond_to do |format|
      format.html { respond_with category, location: admin_tags_path }
      format.js { render 'update' }
    end
  end

  def destroy
    flash.notice = "Esborrat" if category.destroy
    respond_with category, location: admin_tags_path
  end

  def admin

  end
end
