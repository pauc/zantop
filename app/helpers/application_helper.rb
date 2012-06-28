# encoding: utf-8
module ApplicationHelper
  def title(title = nil)
    title = ' :: ' + title unless title.nil?
    content_for(:title) { title }
  end

  def body_classes
    "class='#{controller.controller_name} #{controller.action_name}'"
  end
end
