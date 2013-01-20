# encoding: utf-8
class SessionsController < ApplicationController

  def index
    render 'new'
  end

  def new
    if current_user?
      flash[:notice] = "Hola #{current_user.name}, ja estàs autentificat/da"
      redirect_to front_path
    end
  end

  def create
    user = User.find_by_email(params[:new_session][:email])
    if user && user.authenticate(params[:new_session][:password])
      sign_in user
      redirect_back
    else
      flash.now[:error] = t('.invalid_login')
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to front_path
  end
end
