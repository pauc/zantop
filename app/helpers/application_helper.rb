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
    content_tag tag, link_to('Zantop', front_path), id: 'site_name'
  end

  def body_classes
    "#{controller.controller_name} #{controller.action_name}"
  end

  def front?
    controller.controller_name == 'dashboards' && controller.action_name == 'front'
  end

  def lang_selector
    ca = link_to_unless_current 'ca', url_for(locale: 'ca')
    es = link_to_unless_current 'es', url_for(locale: 'es')
    en = link_to_unless_current 'en', url_for(locale: 'en')
    "<li title='Català'>#{ca}</li> | <li title='English'>#{en}</li> | <li title='Español'>#{es}</li>"
  end
end
