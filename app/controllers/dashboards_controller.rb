class DashboardsController < ApplicationController
  # include Authorization
  # respond_to :html, :js

  # expose(:about_page) { Page.about }
  # expose(:works) do
  #   Work.published.includes(:translations).paginate(page: params[:page], per_page: 6)
  # end

  def home; end

  def about
    #respond_with about_page
  end

  # def admin
  # end

  # def provisional
  # render layout: "empty"
  # end
end
