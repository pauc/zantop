module Authorization
  extend ActiveSupport::Concern

  included do
    before_filter :authorize_admin, only: [:new,
                                     :edit,
                                     :create,
                                     :update,
                                     :destroy,
                                     :admin]

    before_filter :authorise_unpublished, only: [:show]
  end

  private

  def authorize_admin
    unless current_user?
      store_location
      flash[:error] = t('Restricted_access')
      redirect_to login_path
    end
  end

  def authorise_unpublished
    content = self.controller_name.classify.constantize.find(params[:id])
    if content.respond_to?('published') and !content.published? and !current_user
      flash[:error] = t('Restricted_access')
      redirect_to front_path
    end
  end
end
