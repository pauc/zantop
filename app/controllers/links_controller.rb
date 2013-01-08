#encoding: UTF-8
class LinksController < ApplicationController
  include Authorization
  include Sortable

  respond_to :html

  expose :link

  def admin
    respond_with links
  end

  def new
    respond_with links
  end

  def create
    flash.notice = "Enllaç creat" if link.save
    respond_with link, location: admin_links_path
  end

  def edit
    respond_with link
  end

  def update
    flash.notice = "Enllaç actualitzat" if link.save
    respond_with link, location: admin_links_path
  end

  def destroy
    if link.destroy
      flash.notice = "Enllaç esborrat"
    else
      flash.error = "Hi ha hagut un error en esborrar l'enllaç"
    end
    respond_with link, location: admin_links_path
  end
end
