class ActionWorksController < ApplicationController
  include Sortable
  include Finder
  include Authorization
  include CreateWithDefaultLocale
  respond_to :html

  expose(:action_works)
  expose(:action_work)
  expose(:work) { action_work }
  expose(:published_works) { ActionWork.published.includes(:translations) }
  expose(:related_works) { work.related }

  def index
    respond_with published_works, template: 'works/works_list'
  end

  def show
    flash.now[:alert] = t('untranslated_content') unless action_work.
      has_translation?(I18n.locale)
    respond_with action_work, template: 'works/show'
  end

  def new
    respond_with action_work
  end

  def create
    flash.notice = t('created') if action_work.save
    respond_with action_work
  end

  def edit
    respond_with action_work
  end

  def update
    flash.notice = t('updated') if action_work.save
    respond_with action_work
  end

  def destroy
    flash.notice = t("deleted") if action_work.destroy
    respond_with action_work, location: action_works_path
  end
end
