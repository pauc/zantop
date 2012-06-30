module RespondWithCorrectSlug
  extend ActiveSupport::Concern

  def responder_for(object)
    if object.slug == params[:id]
      if !object.translated?(I18n.locale)
        flash.now[:notice] = 'no_translation'
      end
      respond_with object
    else
      redirect_to url_for(object)
    end      
  end
    
  end