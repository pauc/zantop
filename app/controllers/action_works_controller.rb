# frozen_string_literal: true

class ActionWorksController < ApplicationController
  # include Sortable
  # include Finder
  # include Authorization
  # include CreateWithDefaultLocale
  # respond_to :html

  def index
    @published_works = ActionWork.all.includes(:translations)

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
    @work_form = ActionWorkForm.new(**action_work_params)

    if @work_form.submit
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
    raise NotImplementedError
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
              section_attributes: [:title, :body, :position, :_destroy],
              image_attributes: [:image, :video, :credits, :position, :_destroy])
  end
end
