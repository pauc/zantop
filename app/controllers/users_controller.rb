class UsersController < ApplicationController
  respond_to :html

  expose(:users) { User.all }
  expose(:user)

  def index
    respond_with users
  end

  def show
    respond_with user
  end

  def new
    respond_with user
  end

  def edit
    respond_with user
  end

  def create
    falsh[:success] = t('.created', model_name: t('models.User')) if user.save
    respond_with user
  end

  def update
    falsh[:success] = t('.updated', model_name: t('models.User')) if user.save
    respond_with user
  end

  def destroy
    flash[:notice] = t('deleted', model_name: t('models.User')) if user.destroy
    respond_with user, location: users_path
  end
end
