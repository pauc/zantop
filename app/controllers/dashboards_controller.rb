class DashboardsController < ApplicationController
  include Authorization
  respond_to :html, :js

  expose(:about_page) { Page.about }
  expose(:contact_page) { Page.contact }
  expose(:works) { Work.published.paginate(page: params[:page], per_page: 12) }
  expose(:all_works) { Work.all }

  def front

  end

  def about
    respond_with about_page
  end

  def contact
    respond_with contact_page
  end

  def admin

  end

  def provisional
    render layout: "empty"
  end
end
