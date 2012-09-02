class VisualWorksController < ApplicationController
  include Sortable
  respond_to :html

  expose(:visual_works) { VisualWork.all }
  expose(:visual_work)

  before_filter :find_work, only: [:show]

  def index
    respond_with visual_works
  end

  def show
    respond_with visual_work
  end

  def new
    respond_with visual_work
  end

  def create
    flash[:success] = t('Created') if visual_work.save
    respond_with visual_work
  end

  def edit
    respond_with visual_work
  end

  def update
    flash[:success] = t('updated') if visual_work.save
    respond_with visual_work
  end

  def destroy
    flash[:success] = "deleted" if visual_work.destroy
    respond_with visual_work, location: visual_works_path
  end

  private

    def find_work
      visual_work = VisualWork.find params[:id]

      if request.path != visual_work_path(visual_work)
        return redirect_to visual_work, :status => :moved_permanently
      end
    end
end
