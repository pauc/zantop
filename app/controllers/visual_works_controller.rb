class VisualWorksController < ApplicationController
  include Sortable
  include Finder
  include Authorization
  respond_to :html

  expose(:visual_works) { VisualWork.all }
  expose(:visual_work)

  def index

  end

  def show

  end

  def new
    visual_work.images.build
    respond_with visual_work
  end

  def create
    flash[:success] = t('Created') if visual_work.save
    respond_with visual_work
  end

  def edit
    visual_work.images.build if visual_work.images.empty?
    respond_with visual_work
  end

  def update
    flash[:success] = t('updated') if visual_work.save
    respond_with visual_work
  end

  def destroy
    flash[:success] = "deleted" if visual_work.destroy
    respond_with visual_work, location: visual_works_path
  end
end
