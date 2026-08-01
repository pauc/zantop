# frozen_string_literal: true

class TagsController < ApplicationController
  include Authorization

  # include Finder

  allow_anonymous :show

  def show
    @category = Tag.find(params.expect(:id))

    @published_works = @category
                       .works
                       .published
                       .ordered
                       .includes(:plain_text_translations,
                                 :rich_text_translations)
  end

  def update
    @category = Tag.find(params.expect(:id))

    I18n.available_locales.each do |locale|
      I18n.with_locale(locale) do
        if params[:tag][:name][locale].present?
          @category.name = params[:tag][:name][locale]
          @category.save
        end
      end
    end

    flash.notice = "Actualitzat"

    redirect_to admin_tags_path
  end

  def destroy
    @category = Tag.find(params.expect(:id))

    flash.notice = "Esborrat" if @category.destroy

    redirect_to admin_tags_path
  end

  def admin
    @categories = Tag.includes(:plain_text_translations)
  end
end
