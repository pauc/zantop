# frozen_string_literal: true

class DashboardsController < ApplicationController
  include Authorization

  allow_anonymous :front, :about, :more_works

  def front
    @works = Work
             .visible
             .ordered
             .includes(:plain_text_translations)
             .paginate(page: params[:page], per_page: 12)
  end

  def about
    @page = Page.about

    return if @page.translated_into?(I18n.locale)

    flash.now[:alert] = t("untranslated_content")
  end

  def more_works
    works = Work
            .visible
            .ordered
            .includes(:plain_text_translations)
            .paginate(page: params.fetch(:page), per_page: 12)

    render partial: "works", locals: { works: }
  end
end
