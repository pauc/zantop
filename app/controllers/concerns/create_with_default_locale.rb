module CreateWithDefaultLocale
  extend ActiveSupport::Concern

  included do
    before_filter :set_locale_to_default, only: [:new]
  end

  def set_locale_to_default
    if I18n.locale != I18n.default_locale
      flash.notice = "Has de crear els continguts nous primer en la llengua per defecte."
      redirect_to controller: self.controller_name, action: :new, locale: I18n.default_locale.to_s
    end
  end
end
