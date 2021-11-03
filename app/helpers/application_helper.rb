module ApplicationHelper
  def site_name
    tag = home? ? :h1 : :span
    img_src = home? ? 'MireiaZantop.png' : 'MZ.png'
    title = home? ? nil : t('home')

    content_tag(
      tag,
      link_to_unless_current(
        image_tag(
          img_src,
          alt: "Mireia Zantop"
        ),
        home_path,
        title: title
      ),
      id: 'site_name'
    )
  end

  def body_classes
    classes = "#{controller.controller_name} #{controller.action_name}"
    classes += " with_sidebar" if sidebar?
    classes += " no-home" unless home?
    classes
  end

  def home?
    controller.controller_name == 'dashboards' && controller.action_name == 'home'
  end

  def active_link?(url)
    return "active" if url == request.fullpath
  end

private

  def sidebar?
    !home? and
      !(%w(new edit admin).include?(controller.action_name)) or
      controller.controller_name == "contact_messages"
  end
end
