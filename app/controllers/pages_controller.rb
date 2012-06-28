class PagesController < ApplicationController
  respond_to :html
  expose(:page)

  def edit
    respond_with page
  end

  def update
    if page.update_attributes(params[:page])
      flash[:success] = t('updated')
      if page.id == 1
        redirect_to about_path
      elsif page.id == 2
        redirect_to contact_path
      end
    else
      render 'edit'
    end
  end
end