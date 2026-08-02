# frozen_string_literal: true

module ApplicationHelper
  # The separator belongs to `document_title`, which is the only thing that
  # knows whether there is a site name to separate this from.
  def title(title = nil)
    content_for(:title) { title }
  end

  def page_title(title)
    strip_tags(title).then(&method(:title))

    content_for(:page_title) { content_tag(:h1, title.html_safe, id: "main_title") } # rubocop:disable Rails/OutputSafety
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
    "active" if url == request.fullpath
  end

  # An invalid submit comes back as the same page with one paragraph added, so
  # there is nothing to tell someone not looking at the screen that the form
  # did not go through. Taking focus to the summary is that something, and it
  # leaves the reading position at the top of what has to be fixed.
  def error_summary(form)
    form.error_notification tabindex: -1, autofocus: true
  end

  # Third link to the same work in one preview, and the only one whose visible
  # text does not say which work it is. The name says so instead, and in saying
  # so also drops the trailing arrow, which a screen reader would spell out.
  def view_more(work)
    link = link_to(raw("#{t('view_more')} &rarr;"),
                   work,
                   "aria-label": t("view_more_about", work: work.title))

    content_tag "p", link, class: "view-more"
  end

  private

  def sidebar?
    (!front? && %w[new edit admin].exclude?(controller.action_name)) ||
      controller.controller_name == "contact_messages"
  end
end
