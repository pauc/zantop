class PagesController < ApplicationController
  respond_to :html

  expose(:pages) { Page.all }
  expose(:page)

  def index
    respond_with pages
  end

  def show
    if page.id == 1
      redirect_to about_path
    elsif page.id == 2
      redirect_to contact_path
    else
      respond_with page
    end    
  end

  def edit
    respond_with page
  end

  def update
    flash[:success] = t('updated') if page.update_attributes(params[:page])
    respond_with page
  end
end
