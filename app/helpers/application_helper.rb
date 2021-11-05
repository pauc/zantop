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

  def home?
    controller.controller_name == 'dashboards' && controller.action_name == 'home'
  end
end
