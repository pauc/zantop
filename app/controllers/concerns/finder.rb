module Finder
  extend ActiveSupport::Concern

  include ActiveSupport::Inflector

  included do
    before_filter :find_work, only: [:show]
  end

  def find_work
    object = controller_name.classify.constantize.find(params[:id])
    if request.path != polymorphic_url(object, routing_type: :path)
      return redirect_to object, :status => :moved_permanently
    end
  end
end
