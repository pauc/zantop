# encoding: utf-8
module ApplicationHelper
  def title(title = nil)
    title = title + ' | ' unless title.nil?
    content_for(:title) { title }
  end

  def page_title(title)
    title strip_tags(title)
    content_for(:page_title) { "<h1 id='main_title'>#{title}</h1>".html_safe }
  end

  def site_name
    tag = front? ? :h1 : :span
    img_src = front? ? 'MireiaZantop.png' : 'MZ.png'
    content_tag tag, link_to_unless_current(image_tag(img_src, alt: "Mireia Zantop"), front_path), id: 'site_name'
  end

  def body_classes
    classes = "#{controller.controller_name} #{controller.action_name}"
    classes += " with_sidebar" if sidebar?
    classes += " no-front" unless front?
    classes
  end

  def front?
    controller.controller_name == 'dashboards' && controller.action_name == 'front'
  end

  def sidebar?
    !front? and !(%w(new edit admin).include?(controller.action_name))
  end

  def lang_selector
    ca = link_to_unless_current 'cat', url_for(locale: 'ca')
    es = link_to_unless_current 'cast', url_for(locale: 'es')
    en = link_to_unless_current 'eng', url_for(locale: 'en')
    "<li title='Castellano'>#{es}</li> | <li title='Català'>#{ca}</li> | <li title='English'>#{en}</li>"
  end
end
