# frozen_string_literal: true
class DashboardsController < ApplicationController
  # include Authorization

  def front
    @front_works = Work.published.includes(:translations).paginate(page: params[:page], per_page: 6)
  end
end
