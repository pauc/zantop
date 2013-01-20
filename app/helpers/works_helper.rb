module WorksHelper
  def default_image_for_works
    image_tag "mz-comodin.png"
  end

  def print_work_place(work)
    if work.respond_to?("place") and !work.place.blank?
      "<div class='work-place'>#{work.place}</div>".html_safe
    end
  end

  def print_work_date(work)
    if work.respond_to?("realization_date") and !work.realization_date.blank?
      "<div class='work-date'>#{work.realization_date}</div>".html_safe
    end
  end

  def print_work_description(work)
    if work.respond_to?("description") and !work.description.blank?
      "<div class='work-description'>#{work.description}</div>".html_safe
    end
  end

  def print_work_techniques(work)
    if work.respond_to?("techniques") and !work.techniques.blank?
      "<div class='work-description'>#{work.techniques}</div>".html_safe
    end
  end

  def print_work_dimensions(work)
    if work.respond_to?("dimensions") and !work.dimensions.blank?
      "<div class='work-description'>#{work.dimensions}</div>".html_safe
    end
  end

  def print_work_tags(work)
    html = "<div class='work-tags'>"
    html << t('categories') + ": "
    html << work.tags.map { |tag| link_to(tag.name, tag) }.join(", ")
    html << "</div>"
    html.html_safe
  end
end
