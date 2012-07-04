class ActionWorksController < ApplicationController
  respond_to :html

  expose(:action_works) { ActionWork.all }
  expose(:action_work)

  before_filter :find_work, only: [:show]

  def index
    respond_with action_works
  end

  def show
    respond_with action_work
  end

  def new
    respond_with action_work
  end

  def create
    flash[:success] = t('Created') if action_work.save
    respond_with action_work
  end

  def edit
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

  private

    def find_work
      action_work = ActionWork.find params[:id]

      if request.path != action_work_path(action_work)
        return redirect_to action_work, :status => :moved_permanently
      end
    end
end
