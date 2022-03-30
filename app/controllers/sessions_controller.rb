# frozen_string_literal: true

class SessionsController < ApplicationController
  def index
    render :new
  end

  def new
    if current_user
      redirect_back_or_to root_path, notice: "Hola #{current_user.name}, ja estàs autenticada"

      return
    end

    render :new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      sign_in(user)
      redirect_to root_path
    else
      flash.now[:error] = t(".invalid_login")
      render :new
    end
  end

  def destroy
    @current_user     = nil
    session[:user_id] = nil

    redirect_to root_path
  end

  private

  def session_params
    params.require(:session)
          .permit(:email, :password)
  end

  def sign_in(user)
    @current_user = user
    session[:user_id] = user.id
  end
end
