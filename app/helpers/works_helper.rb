module WorksHelper
  def default_image_for_works
    image_tag "mz-comodin.png"
  end

  def print_work_place(work)
    return unless work.respond_to?("place") && work.place.present?

    "<div class='work-place'><p>#{work.place}</p></div>".html_safe
  end

  def print_work_date(work)
    return unless work.respond_to?("realization_date") && work.realization_date.present?

    if work.instance_of?(ActionWork)
      "<div class='work-date'><p>#{l work.realization_date}</p></div>".html_safe
    elsif work.instance_of?(VisualWork)
      "<div class='work-date'><p>#{work.realization_date.strftime('%Y')}</p></div>".html_safe
    end
  end

  def print_work_description(work)
    return unless work.respond_to?("description") && work.description.present?

    "<div class='work-description'>#{work.description}</div>".html_safe
  end

  def print_work_truncated_description(work)
    return unless work.respond_to?("description") && work.description.present?

    # description = truncate_html( work.description, length: 300, omission: ' ...', separator: ' ' )
    description = work.description
    "<div class='work-description'>#{description}</div>".html_safe
  end

  def print_work_field(work, field)
    return unless work.respond_to?(field) && work.send(field).present?

    field_translation = t("works.labels.#{field}")
    html = "<div class='work-#{field}'>"
    html << "<p><strong>#{field_translation}:</strong> #{work.send(field)}</p>"
    html << "</div>"
    html.html_safe
  end

  def print_work_tags(work)
    return unless work.tags.size.positive?

    html = "<div class='work-tags'>"
    html << "#{t('categories')}: "
    html << work.tags.map { |tag| link_to(tag.name, tag) }.join(", ")
    html << "</div>"
    html.html_safe
  end

  def url_for_edit_work(work)
    if work.instance_of?(ActionWork)
      edit_action_work_path(work)
    else
      edit_visual_work_path(work)
    end
  end

  def translation_info(work, locale)
    css_class = work.translation?(locale) ? "translated" : "untranslated"
    I18n.with_locale(locale) do
      link_to t(locale), url_for_edit_work(work), class: css_class
    end
  end
end
