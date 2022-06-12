# frozen_string_literal: true

class UsersController < ApplicationController
  include Authorization

  def new
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    flash[:success] = t(".created", model_name: t("models.User")) if user.save
    respond_with user
  end

  def update
    flash[:success] = t(".updated", model_name: t("models.User")) if user.save
    respond_with user, location: front_path
  end
end
