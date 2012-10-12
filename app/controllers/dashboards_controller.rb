class DashboardsController < ApplicationController
  respond_to :html, :js

  expose(:about_page) { Page.about }
  expose(:contact_page) { Page.contact }
  expose(:works) { Work.paginate(page: params[:page], per_page: 12) }

  def front

  end

  def about
    respond_with about_page
  end

  def contact
    respond_with contact_page
  end

  def provisional
    render layout: "empty"
  end
end
