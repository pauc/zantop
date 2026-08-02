# frozen_string_literal: true

class DashboardsController < ApplicationController
  include Authorization

  allow_anonymous :front, :about, :contact, :more_works

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

  # Unlike #about, an intro missing the requested locale raises no warning
  # here. The line pointing at the mailbox is a view translation rather than
  # page content, so the one thing this page exists to say is in the visitor's
  # language whatever the row above it falls back to.
  def contact
    @page = Page.contact
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
