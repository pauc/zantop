# frozen_string_literal: true

module ApplicationHelper
  def title(title = nil)
    title += " | " unless title.nil?
    content_for(:title) { title }
  end

  def page_title(title)
    strip_tags(title)
      .then(&method(:title))

    content_for(:page_title) {
      content_tag(:h1, title, id: "main_title")
    }
  end

  def site_name
    tag = front? ? :h1 : :span
    img_src = front? ? "MireiaZantop.png" : "MZ.png"
    title = front? ? nil : t("home")

    content_tag(
      tag,
      link_to_unless_current(
        image_tag(
          img_src,
          alt: "Mireia Zantop"
        ),
        root_path,
        title:
      ),
      id: "site_name"
    )
  end

  def body_classes
    classes = [controller.controller_name, controller.action_name]
    classes << "with-sidebar" if sidebar?
    classes << "no-front" unless front?

    classes.join(" ")
  end

  def front?
    controller.controller_name == "dashboards" && controller.action_name == "front"
  end

  def active_link?(url)
    return "active" if url == request.fullpath
  end

  def page_name
    case controller.controller_name
    when "action_works"
      t("menu.action_art")
    when "visual_works"
      t("menu.visual_art")
    when "dashboards"
      t("menu.about") if controller.action_name == "about"
    when "contact_messages"
      t("menu.contact")
    end
  end

  def view_more(destination)
    content_tag "p", link_to(raw("#{t('view_more')} &rarr;"), destination), class: "view-more"
  end

  private

  def sidebar?
    (!front? && %w[new edit admin].exclude?(controller.action_name)) ||
      controller.controller_name == "contact_messages"
  end
end
