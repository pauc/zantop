# frozen_string_literal: true

class ActionWorksController < ApplicationController
  # include Sortable
  # include Finder
  # include Authorization
  # include CreateWithDefaultLocale

  def index
    @published_works = ActionWork.includes(:plain_text_translations,
                                           :rich_text_translations)

    render "works/works_list"
  end

  def show
    @work = ActionWork.find(params[:id])
    @related_works = @work.related

    flash.now[:alert] = t("untranslated_content") unless @work.translated_into?(I18n.locale)

    render template: "works/show"
  end

  def new
    @work_form = ActionWorkForm.new

    render :new
  end

  def create
    @work_form = ActionWorkForm.new

    if @work_form.submit(action_work_params)
      flash.notice = t("created")

      redirect_to action_works_path and return
    end

    render :new
  end

  def edit
    @work_form = ActionWorkForm.new(work: ActionWork.find(params[:id]))

    render :edit
  end

  def update
    @work_form = ActionWorkForm.new(work: ActionWork.find(params[:id]))

    if @work_form.submit(action_work_params)
      flash.notice = t("updated")

      redirect_to action_work_path(@work_form.id) and return
    end

    render :edit
  end

  def destroy
    ActionWork.find(params[:id]).destroy!

    redirect_to action_works_path, notice: t("deleted")
  end

  private

  def action_work_params
    params
      .require(:action_work_form)
      .permit(:title,
              :description,
              :place,
              :realization_date,
              :published,
              tags: [],
              section_attributes: [:title, :body, :position, :_destroy],
              image_attributes: [:image, :video, :credits, :position, :_destroy])
  end
end
