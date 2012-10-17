class VisualWorksController < ApplicationController
  include Sortable
  include Finder
  include Authorization
  include CreateWithDefaultLocale
  respond_to :html

  expose(:visual_works)
  expose(:visual_work)
  expose(:published_works) { VisualWork.published }

  def index
    respond_with published_works
  end

  def show

  end

  def new
    visual_work.images.build
  end

  def create
    flash.notice = t('Created') if visual_work.save
    respond_with visual_work
  end

  def edit
    visual_work.images.build if visual_work.images.empty?
  end

  def update
    flash.notice = t('updated') if visual_work.save
    respond_with visual_work
  end

  def destroy
    flash.notice = t("deleted") if visual_work.destroy
    respond_with visual_work, location: visual_works_path
  end
end
