class VisualWorksController < ApplicationController
  include Sortable
  include Finder
  include Authorization
  include CreateWithDefaultLocale
  respond_to :html

  expose(:visual_works)
  expose(:visual_work)
  expose(:work) { visual_work }
  expose(:published_works) { VisualWork.published.includes(:translations) }

  def index
    respond_with published_works, template: 'works/works_list'
  end

  def show
    respond_with visual_work, template: 'works/show'
  end

  def new
    visual_work.images.build
    respond_with visual_work
  end

  def create
    flash.notice = t('Created') if visual_work.save
    respond_with visual_work
  end

  def edit
    visual_work.images.build if visual_work.images.empty?
    respond_with visual_work
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
