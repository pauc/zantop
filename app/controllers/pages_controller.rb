# frozen_string_literal: true

class PagesController < ApplicationController
  def edit
    @page = Page.find(params.expect(:id))
  end

  def update
    @page = Page.find(params.expect(:id))

    if @page.update(page_params)
      flash.notice = t("updated")

      redirect_to destination_for(@page) and return
    end

    render :edit, status: :unprocessable_content
  end

  private

  def page_params
    params.expect(page: [:title, :body])
  end

  # Only the two static pages are editable, and each one is read back on the
  # page it belongs to rather than on a show action of its own.
  def destination_for(page)
    page.contact? ? contact_path : about_path
  end
end
