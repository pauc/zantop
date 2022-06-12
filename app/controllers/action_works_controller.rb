# frozen_string_literal: true

class ActionWorksController < ApplicationController
  include Authorization
  # include Sortable
  # include Finder
  # include CreateWithDefaultLocale
  # respond_to :html

  # expose(:action_works)
  # expose(:action_work)
  # expose(:work) { action_work }
  # expose(:published_works) { ActionWork.published.includes(:translations) }
  # expose(:related_works) { work.related }

  def index
    @published_works = ActionWork.all.includes(:translations)
    render template: "works/works_list"
  end

  def show
    @work = ActionWork.find(params[:id])
    @related_works = @work.related

    flash.now[:alert] = t("untranslated_content") unless @work.has_translation?(I18n.locale)

    render template: "works/show"
  end

  def new
    @action_work = ActionWork.new
  end

  # def create
  #   flash.notice = t('created') if action_work.save
  #   respond_with action_work
  # end

  # def edit
  #   respond_with action_work
  # end

  # def update
  #   flash.notice = t('updated') if action_work.save
  #   respond_with action_work
  # end

  # def destroy
  #   flash.notice = t("deleted") if action_work.destroy
  #   respond_with action_work, location: action_works_path
  # end
end
