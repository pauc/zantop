# encoding: utf-8
module ApplicationHelper
  def title(title = nil)
    title = title + ' | ' unless title.nil?
    content_for(:title) { title }
  end

  def page_title(title)
    content_for(:page_title) { title.html_safe }
    title strip_tags(title)
  end

  def site_name
    tag = front? ? :h1 : :span
    content_tag tag, link_to('Zantop', home_path), id: 'site_name'
  end

  def body_classes
    "#{controller.controller_name} #{controller.action_name}"
  end

  def front?
    controller.controller_name == 'dashboards' && controller.action_name == 'front'
  end

  def lang_selector
    ca = I18n.locale == :ca ? 'ca' : link_to('ca', url_for(locale: 'ca'))
    es = I18n.locale == :es ? 'es' : link_to('es', url_for(locale: 'es'))
    en = I18n.locale == :en ? 'en' : link_to('en', url_for(locale: 'en'))
    "<li title='Català'>#{ca}</li> | <li title='English'>#{en}</li> | <li title='Español'>#{es}</li>"
  end
end
