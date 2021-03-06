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
  expose(:related_works) { work.related }

  def index
    respond_with published_works, template: 'works/works_list'
  end

  def show
    flash.now[:alert] = t('untranslated_content') unless visual_work.
      has_translation?(I18n.locale)
    respond_with visual_work, template: 'works/show'
  end

  def new
    respond_with visual_work
  end

  def create
    flash.notice = t('Created') if visual_work.save
    respond_with visual_work
  end

  def edit
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
