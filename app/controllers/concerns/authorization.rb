module Authorization
  extend ActiveSupport::Concern

  included do
    before_filter :authorize, only: [:new,
                                     :edit,
                                     :create,
                                     :update,
                                     :destroy,
                                     :admin]
  end

  private

  def authorize
    unless current_user?
      store_location
      redirect_to login_path
    end
  end

end
