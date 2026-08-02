# frozen_string_literal: true

# The half of <head> that is about the page rather than about the assets: the
# description, the Open Graph card a shared link previews with, and the
# canonical and hreflang links.
#
# A template declares whatever is its own through `page_metadata`; anything it
# leaves out falls back to a site-wide default, so a page that says nothing
# still previews as the portfolio rather than as a bare URL.
module MetadataHelper
  SITE_NAME = "ZANTOP"
  # Search results and preview cards both stop somewhere around here; past it
  # the tail is only weight in the response.
  DESCRIPTION_LENGTH = 160
  # The version to offer a visitor none of the alternates matches. Catalan is
  # the site's own language, and the locale `set_locale` itself falls back to.
  X_DEFAULT_LOCALE = :ca

  # `record` is the model the URL names. It is needed because its slug differs
  # per locale, so the other two URLs for this page cannot be had by swapping
  # the prefix of the current path — see `localized_url`.
  # rubocop:disable Rails/HelperInstanceVariable -- see `page_record`
  def page_metadata(description: nil, image: nil, record: nil, type: "website")
    @page_record = record
    content_for(:meta_description, summarize(description), flush: true) if description.present?
    content_for(:meta_image, preview_image_url(image), flush: true) if image
    content_for(:meta_type, type, flush: true)
    content_for(:meta_canonical, canonical_url(record), flush: true)
    content_for(:meta_alternates, alternate_link_tags(record), flush: true)
  end

  def document_title
    safe_join([content_for(:title).presence, SITE_NAME].compact, " | ")
  end

  def metadata_tags
    safe_join([tag.meta(name: "description", content: meta_description),
               robots_tag,
               open_graph_tags,
               # X and everything else that reads these speak Open Graph for
               # the content itself; the card shape is the one thing Open Graph
               # has no property for.
               tag.meta(name: "twitter:card", content: "summary_large_image"),
               tag.link(rel: "canonical", href: meta_canonical),
               meta_alternates].compact,
              "\n    ")
  end

  # The URL this page wants to be known by — not `request.url`, since a work
  # answers under any of its three slugs and only one of them belongs to the
  # locale being rendered.
  def canonical_url(record = nil)
    localized_url(I18n.locale, record)
  end

  def alternate_urls(record = nil, path_parameters: request.path_parameters)
    I18n.available_locales.index_with { |locale| localized_url(locale, record, path_parameters:) }
  end

  # The record the template declared through `page_metadata`, if any. The
  # layout renders after the template, so by the time the header asks, the
  # answer is there — and the language links need exactly what the hreflang
  # tags need, rather than a second, worse way of guessing it.
  #
  # An instance variable on purpose, which is what the cop above objects to:
  # this is the same trick `content_for` plays, carried across the same gap,
  # and `content_for` can only hold a string.
  def page_record
    @page_record
  end
  # rubocop:enable Rails/HelperInstanceVariable

  # Asks the router for this same route in another locale rather than rewriting
  # the path: `route_translator` translates every segment, so /ca/art-visual is
  # /en/visual-art, and `friendly_id`'s `simple_i18n` gives the record a
  # different slug in each locale on top of that.
  #
  # `path_parameters` defaults to the request's, which is what a page in its own
  # <head> wants. The sitemap is the caller that has to pass its own: it speaks
  # about pages other than the one being served, and it is not itself a
  # localized route, so `request.path_parameters` there names no locale and no
  # page worth linking to. `only_path` is for the language switcher, whose links
  # stay on the site and so want no host on them.
  def localized_url(locale, record = nil,
                    path_parameters: request.path_parameters, only_path: false)
    options = path_parameters.merge(locale: locale.to_s, only_path:)
    options[:id] = I18n.with_locale(locale) { record.to_param } if record

    url_for(options)
  end

  private

  def meta_description
    content_for(:meta_description).presence || t("meta.descriptions.site")
  end

  def meta_canonical
    content_for(:meta_canonical).presence || canonical_url
  end

  def meta_alternates
    content_for(:meta_alternates).presence || alternate_link_tags
  end

  def meta_image
    content_for(:meta_image).presence || image_url("MireiaZantop.png")
  end

  def meta_title
    content_for(:title).presence || SITE_NAME
  end

  def meta_type
    content_for(:meta_type).presence || "website"
  end

  def open_graph_tags
    properties = { "og:type" => meta_type,
                   "og:site_name" => SITE_NAME,
                   "og:locale" => I18n.locale,
                   "og:title" => meta_title,
                   "og:description" => meta_description,
                   "og:url" => meta_canonical,
                   "og:image" => meta_image }

    safe_join(properties.map { |property, content| tag.meta(property:, content:) }, "\n    ")
  end

  def alternate_link_tags(record = nil)
    urls = alternate_urls(record)
    links = urls.map { |locale, url| tag.link(rel: "alternate", hreflang: locale, href: url) }
    links << tag.link(rel: "alternate", hreflang: "x-default", href: urls.fetch(X_DEFAULT_LOCALE))

    safe_join(links, "\n    ")
  end

  # robots.txt keeps crawlers from fetching the admin area; only `noindex`
  # keeps a URL somebody linked to from being indexed unfetched. Which actions
  # are public is `Authorization`'s answer, asked again here so the two cannot
  # drift.
  def robots_tag
    action = request.path_parameters[:action]
    return if controller.try(:anonymous_actions).to_a.include?(action)

    tag.meta(name: "robots", content: "noindex, nofollow")
  end

  # A work's description and a page's body are rich text, so they arrive
  # wrapped in the markup and line breaks Trix saved them with; a translated
  # string arrives clean but still wants clamping.
  def summarize(text)
    plain = text.respond_to?(:to_plain_text) ? text.to_plain_text : strip_tags(text.to_s)

    plain.squish.truncate(DESCRIPTION_LENGTH, separator: " ")
  end

  # A redirect URL, so nothing has to process the variant to render the page —
  # the crawler that follows it is what pays for that.
  def preview_image_url(variant)
    rails_representation_url(variant)
  end
end
