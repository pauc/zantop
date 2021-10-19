module ApplicationHelper
  def site_name
    tag = front? ? :h1 : :span
    img_src = front? ? 'MireiaZantop.png' : 'MZ.png'
    title = front? ? nil : t('home')

    content_tag(
      tag,
      link_to_unless_current(
        image_tag(
          img_src,
          alt: "Mireia Zantop"
        ),
        front_path,
        title: title
      ),
      id: 'site_name'
    )
  end

  def front?
    controller.controller_name == 'dashboards' && controller.action_name == 'front'
  end
end
