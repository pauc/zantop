class ActionWorksController < ApplicationController
  include Sortable
  include Finder
  include Authorization
  respond_to :html

  expose(:action_works) { ActionWork.all }
  expose(:action_work)

  def index

  end

  def show

  end

  def new
    action_work.images.build
    respond_with action_work
  end

  def create
    flash[:success] = t('Created') if action_work.save
    respond_with action_work
  end

  def edit
    action_work.images.build if action_work.images.empty?
    respond_with action_work
  end

  def update
    flash[:success] = t('updated') if action_work.save
    respond_with action_work
  end

  def destroy
    flash[:success] = "deleted" if action_work.destroy
    respond_with action_work, location: action_works_path
  end
end
