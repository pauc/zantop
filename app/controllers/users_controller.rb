class UsersController < ApplicationController
  respond_to :html
  include Authorization

  expose(:user)

  def new

  end

  def edit

  end

  def create
    flash[:success] = t('.created', model_name: t('models.User')) if user.save
    respond_with user
  end

  def update
    flash[:success] = t('.updated', model_name: t('models.User')) if user.save
    respond_with user, location: front_path
  end
end
