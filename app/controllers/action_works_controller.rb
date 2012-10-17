class ActionWorksController < ApplicationController
  include Sortable
  include Finder
  include Authorization
  include CreateWithDefaultLocale
  respond_to :html

  expose(:action_works)
  expose(:action_work)
  expose(:published_works) { ActionWork.published }

  def index
    respond_with published_works
  end

  def show

  end

  def new
    action_work.images.build
  end

  def create
    flash.notice = t('Created') if action_work.save
    respond_with action_work
  end

  def edit
    action_work.images.build if action_work.images.empty?
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
