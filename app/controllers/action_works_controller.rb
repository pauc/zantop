# frozen_string_literal: true

class ActionWorksController < ApplicationController
  include Authorization

  # include Sortable
  # include Finder
  # include CreateWithDefaultLocale

  allow_anonymous :index, :show

  def index
    @published_works = ActionWork.ordered
                                 .includes(:plain_text_translations,
                                           :rich_text_translations)

    render "works/works_list"
  end

  def show
    @work = ActionWork.find(params.expect(:id))
    @related_works = @work.related

    flash.now[:alert] = t("untranslated_content") unless @work.translated_into?(I18n.locale)

    render template: "works/show"
  end

  def new
    @work_form = ActionWorkForm.new

    render :new
  end

  def edit
    @work_form = ActionWorkForm.new(work: ActionWork.find(params.expect(:id)))

    render :edit
  end

  def create
    @work_form = ActionWorkForm.new

    if @work_form.submit(action_work_params)
      flash.notice = t("created")

      redirect_to action_works_path and return
    end

    render :new
  end

  def update
    @work_form = ActionWorkForm.new(work: ActionWork.find(params.expect(:id)))

    if @work_form.submit(action_work_params)
      flash.notice = t("updated")

      redirect_to action_work_path(@work_form.id) and return
    end

    render :edit
  end

  def destroy
    ActionWork.find(params.expect(:id)).destroy!

    redirect_to action_works_path, notice: t("deleted")
  end

  private

  def action_work_params
    params
      .expect(action_work_form: [:title,
                                 :description,
                                 :place,
                                 :realization_date,
                                 :published,
                                 {
                                   tags: [],
                                   section_attributes: [[:title, :body, :position, :_destroy]],
                                   image_attributes: [[:image, :video, :credits, :position,
                                                       :_destroy]]
                                 }])
  end
end
