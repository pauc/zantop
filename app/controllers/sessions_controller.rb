class SessionsController < ApplicationController
  before_filter :create_first_user, only: [:create]

  def index
    render 'new'
  end

  def new
    
  end

  def create
    if User.all.empty?
      create_first_user
    end

    user = User.find_by_email(params[:new_session][:email])
    if user && user.authenticate(params[:new_session][:password])
      sign_in user
      flash[:success] = "Hola #{user.name.camelize}!!"
      redirect_to root_url
    else
      flash.now[:error] = t('.invalid_login')
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_url, :notice => "Logged out!"
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
