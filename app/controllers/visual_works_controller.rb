# frozen_string_literal: true

class VisualWorksController < ApplicationController
  include Authorization

  allow_anonymous :index, :show

  def index
    @works = VisualWork.visible
                       .ordered
                       .includes(:plain_text_translations,
                                 :rich_text_translations)
    render "works/works_list"
  end

  def show
    @work = VisualWork.visible_find(params.expect(:id))
    @related_works = @work.related

    flash.now[:alert] = t("untranslated_content") unless @work.translated_into?(I18n.locale)

    render template: "works/show"
  end

  def new
    @work_form = VisualWorkForm.new

    render :new
  end

  def edit
    @work_form = VisualWorkForm.new(work: VisualWork.find(params.expect(:id)))

    render :edit
  end

  def create
    @work_form = VisualWorkForm.new

    if @work_form.submit(visual_work_params)
      flash.notice = t("created")

      redirect_to visual_works_path and return
    end

    render :new
  end

  def update
    @work_form = VisualWorkForm.new(work: VisualWork.find(params.expect(:id)))

    if @work_form.submit(visual_work_params)
      flash.notice = t("updated")

      redirect_to visual_work_path(@work_form.id) and return
    end

    render :edit
  end

  def destroy
    VisualWork.find(params.expect(:id)).destroy!

    redirect_to visual_works_path, notice: t("deleted")
  end

  private

  def visual_work_params
    params
      .expect(visual_work_form: [:title,
                                 :description,
                                 :techniques,
                                 :dimensions,
                                 :year,
                                 :published,
                                 {
                                   tags: [],
                                   section_attributes: [[:title, :body, :position, :_destroy]],
                                   image_attributes: [[:image, :video, :credits, :position,
                                                       :_destroy]]
                                 }])
  end
end
