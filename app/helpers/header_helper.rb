module HeaderHelper
  def lang_selector
    ca = link_to_unless_current('cat', url_for(locale: 'ca'))
    es = link_to_unless_current('cast', url_for(locale: 'es'))
    en = link_to_unless_current('eng', url_for(locale: 'en'))

    "<li title='Castellano'>#{es}</li> | " \
      "<li title='Català'>#{ca}</li> | " \
      "<li title='English'>#{en}</li>"
  end
end
