# frozen_string_literal: true

class WorksController < ApplicationController
  include Authorization

  def admin
    @works = Work
             .ordered
             .includes(:plain_text_translations, :rich_text_translations)
  end

  def sort
    Work.reposition(params.expect(work_ids: []))

    head :no_content
  end
end
