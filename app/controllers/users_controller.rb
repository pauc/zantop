class UsersController < ApplicationController
  respond_to :html
  include Authorization

  expose(:users) { User.all }
  expose(:user)

  def index

  end

  def show

  end

  def new

  end

  def edit

  end

  def create
    falsh[:success] = t('.created', model_name: t('models.User')) if user.save
    respond_with user
  end

  def update
    flash[:success] = t('.updated', model_name: t('models.User')) if user.save
    respond_with user
  end

  def destroy
    flash[:notice] = t('deleted', model_name: t('models.User')) if user.destroy
    respond_with user, location: users_path
  end
end
