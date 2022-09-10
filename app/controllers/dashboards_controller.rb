# frozen_string_literal: true

class DashboardsController < ApplicationController
  # include Authorization

  def front
    @works = Work
             .published
             .includes(:plain_text_translations)
             .paginate(page: params[:page], per_page: 12)
  end

  def more_works
    works = Work
            .published
            .includes(:plain_text_translations)
            .paginate(page: params.fetch(:page), per_page: 12)

    render partial: "works", locals: { works: }
  end
end
