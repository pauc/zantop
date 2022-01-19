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
    classes = [controller.controller_name, controller.action_name]
    classes << "with_sidebar" if sidebar?
    classes << "no-home" unless home?

    classes.join(' ')
  end

  def home?
    controller.controller_name == 'dashboards' && controller.action_name == 'home'
  end

  def active_link?(url)
    return "active" if url == request.fullpath
  end

  def page_name
    case controller.controller_name
    when 'action_works'
      t('menu.action_art')
    when 'visual_works'
      t('menu.visual_art')
    when 'dashboards'
      t('menu.about') if controller.action_name == 'about'
    when 'contact_messages'
      t('menu.contact')
    end
  end

  private

  def sidebar?
    (!home? && %w[new edit admin].exclude?(controller.action_name)) ||
      controller.controller_name == "contact_messages"
  end

  def page_title(title = nil)
    title += ' | ' unless title.nil?
    content_for(:title) { title }
  end
end
