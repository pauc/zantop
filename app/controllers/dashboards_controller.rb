# frozen_string_literal: true
class DashboardsController < ApplicationController
  # include Authorization
  # respond_to :html, :js

  def front
    # @front_works = Work.published.includes(:translations).paginate(page: params[:page], per_page: 6)
    @front_works = Work.published.includes(:translations)
  end
end
