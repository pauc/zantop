class TagsController < ApplicationController
  include Finder
  include Authorization
  respond_to :html

  expose(:categories) { Tag.order('created_at DESC') }
  expose(:category) { Tag.find(params[:id]) }
  expose(:published_works) { category.works.published }

  def index
    respond_to do |format|
      format.json { render json: Tag.tokens(params[:q]) }
    end
  end

  def show
    respond_with category, template: 'application/works_list'
  end

  def update
    initial_locale = I18n.locale
    I18n.available_locales.each do |locale|
      I18n.locale = locale
      category.name = params[:tag][:name][locale]
      category.save
    end
    I18n.locale = initial_locale

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
