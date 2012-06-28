class DashboardsController < ApplicationController
  respond_to :html

  expose(:about_page) { Page.about }
  expose(:contact_page) { Page.contact }

  def about
    respond_with about_page
  end

  def contact
    respond_with contact_page
  end
end
