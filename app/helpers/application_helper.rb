# encoding: utf-8
module ApplicationHelper
  def title(title = nil)
    title = ' :: ' + title unless title.nil?
    content_for(:title) { title }
  end

  def body_classes
    "class='#{controller.controller_name} #{controller.action_name}'"
  end

  def page_title
    tag = front? ? :h1 : :span
    content_tag tag, link_to('Zantop', root_path), id: 'page_title'
  end

  def front?
    controller.controller_name == 'dashboards' && controller.action_name == 'front'
  end
end
