class SessionsController < ApplicationController

  def index
    render 'new'
  end

  def new

  end

  def create
    create_first_user if User.all.empty?

    user = User.find_by_email(params[:new_session][:email])
    if user && user.authenticate(params[:new_session][:password])
      sign_in user
      flash[:success] = "Hola #{user.name.camelize}!!"
      redirect_to front_path
    else
      flash.now[:error] = t('.invalid_login')
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to front_path
  end

  private

    def create_first_user
      User.create(name: 'admin',
                  email: 'pausandalio@gmail.com',
                  password: 'secret',
                  password_confirmation: 'secret',
                  admin: true ) if User.all.empty?
    end
end
