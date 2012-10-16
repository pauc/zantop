noticeclass UsersController < ApplicationController
  respond_to :html
  include Authorization

  expose(:users) { User.all }
  expose(:user)

  def new

  end

  def edit

  end

  def create
    falsh.notice = t('.created', model_name: t('models.User')) if user.save
    respond_with user
  end

  def update
    flash.notice = t('.updated', model_name: t('models.User')) if user.save
    respond_with user, location: front_path
  end
end
