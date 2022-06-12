# frozen_string_literal: true

class TagsController < ApplicationController
  # include Finder
  include Authorization

  def index
    @categories = Tag.includes(:translations)
    respond_to do |format|
      format.json { render json: Tag.tokens(params[:q]) }
    end
  end

  def show
    @category = Tag.find(params[:id])
    @published_works = @category.works.published.includes(:translations)
  end

  def update
    @category = Tag.find(params[:id])

    I18n.available_locales.each do |locale|
      I18n.with_locale(locale) do
        if params[:tag][:name][locale].present?
          @category.name = params[:tag][:name][locale]
          @category.save
        end
      end
    end

    respond_to do |format|
      format.html { respond_with category, location: admin_tags_path }
      format.js { render "update" }
    end
  end

  def destroy
    @category = Tag.find(params[:id])

    flash.notice = "Esborrat" if @category.destroy
    respond_with @category, location: admin_tags_path
  end

  def admin
    @categories = Tag.includes(:translations)
  end
end
