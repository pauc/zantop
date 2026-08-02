# frozen_string_literal: true

# Every public page of the site, once each, as the routing half of a URL: the
# controller and action that name the page, plus the record whose slug
# completes the path where there is one.
#
# Only the routing half, because turning that into an absolute URL per locale
# is `MetadataHelper#localized_url`'s job — the same method the <head> of every
# page already uses for rel=canonical and its hreflang alternates. The sitemap
# makes the same claim about the same pages, so it has no business working the
# URLs out a second way: route_translator translates the path segments and
# friendly_id gives each record a different slug per locale, and one of those
# two getting out of step with the <head> is exactly the contradiction a
# crawler would then have to resolve.
#
# `published` throughout, deliberately, rather than `Work.visible`: `visible`
# answers according to `Current.user`, so the owner fetching /sitemap.xml while
# signed in would be handed her own drafts. A sitemap is a statement about the
# public site — proxied, cached, and fetched by crawlers that are nobody — and
# it has to say the same thing to everyone who asks.
class Sitemap
  # `record` is nil for the pages that are a route and nothing else: the front
  # page, the two indexes and the two static pages carry no slug. About and
  # Contact are `Page` rows, but they are read back on the actions below rather
  # than on a show action of their own, so there is no record for a URL to name.
  Entry = Data.define(:controller, :action, :record)

  class Entry
    def initialize(controller:, action:, record: nil) = super

    # Shaped like `request.path_parameters`, which is what `localized_url`
    # takes: the route to look up, minus the locale it supplies itself.
    def path_parameters
      { controller:, action: }
    end
  end

  # In the order a reader meets them — the menu's own order first, then the
  # works it leads to, then the tags that cut across them.
  def entries
    [*route_entries, *work_entries, *tag_entries]
  end

  private

  def route_entries
    [Entry.new(controller: "dashboards", action: "front"),
     Entry.new(controller: "action_works", action: "index"),
     Entry.new(controller: "visual_works", action: "index"),
     Entry.new(controller: "dashboards", action: "about"),
     Entry.new(controller: "contact_messages", action: "new")]
  end

  # `ordered`, so the sitemap lists the works in the order the site itself
  # does. Nothing translated is read from these — `to_param` reads the
  # `slug_ca`/`slug_es`/`slug_en` columns — so there is nothing to eager load.
  def work_entries
    Work.published.ordered.map do |work|
      Entry.new(controller: work.model_name.route_key, action: "show", record: work)
    end
  end

  # `enabled` is already "has at least one published work", which is the same
  # question the menu asks: a tag whose every work is a draft leads to an empty
  # page and does not belong in a sitemap any more than in the navigation.
  def tag_entries
    Tag.enabled.map { |tag| Entry.new(controller: "tags", action: "show", record: tag) }
  end
end
