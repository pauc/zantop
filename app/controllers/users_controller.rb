# frozen_string_literal: true

class UsersController < ApplicationController
  include Authorization

  before_action :set_user

  def edit
    render :edit
  end

  def update
    if @user.update(user_params)
      flash.notice = t("updated")

      redirect_to root_path and return
    end

    render :edit
  end

  private

  # The signed in user is the only one this screen can reach: the route is a
  # singular resource, so there is no id to look anyone else up by. Authorization
  # has already turned away anyone without a session, so there is always one.
  def set_user
    @user = current_user
  end

  # `password` and `password_confirmation` are left blank when only the name or
  # the email changes: `has_secure_password` validates the pair on create only,
  # so an empty pair updates the rest of the record and leaves the digest be.
  def user_params
    params
      .expect(user: [:name, :email, :password, :password_confirmation])
  end
end
