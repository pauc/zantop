# frozen_string_literal: true

# Every public page of the site, once each, as the routing half of a URL: the
# controller and action that name the page, plus the record whose slug
# completes the path where there is one, plus the date it last changed.
#
# The dates are this class's real work. A URL is a fact about the routes; a
# lastmod is a claim, and a crawler only keeps reading them while they hold, so
# what each page's date is *of* is decided here, page kind by page kind, and
# left out where there is no honest answer.
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
  #
  # `lastmod` is its own member rather than something read off `record`, and
  # that is the whole reason those two are separate: `record` is the half of a
  # URL that a slug completes, and a page can have a date without having one.
  # The About page is exactly that — a `Page` row rendered on a route of its
  # own — and the front page and the two indexes have a date that belongs to no
  # single record at all. It is nil where the page has no date worth claiming;
  # a sitemap is allowed to carry the field on some entries and not others, and
  # the one thing it must not do is make a date up.
  Entry = Data.define(:controller, :action, :record, :lastmod)

  class Entry
    def initialize(controller:, action:, record: nil, lastmod: nil) = super

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

  # The front page and the two indexes are lists of works and nothing else, so
  # their date is the newest date among the works they list. A page whose
  # lastmod never moves is worse than a page with no lastmod: it is a standing
  # claim that the front page has not changed since the day it was written.
  #
  # `published` here for the same reason as everywhere else in this class, and
  # with one consequence worth naming: unpublishing or deleting a work removes
  # a card from these lists without moving the newest date among the ones that
  # are left, so their lastmod lags until the next edit. Reaching for
  # `Work.maximum` instead would fix that and break the commoner case, moving
  # the front page's date every time a draft nobody can see is touched. Neither
  # catches a deletion, which leaves no row to ask.
  #
  # About and contact are each an editable `Page` row and nothing else — the
  # one line the contact template adds of its own is a translation, which moves
  # when the app is deployed rather than when the page is edited. So the row's
  # own `updated_at` is the whole of either page's date.
  def route_entries
    [Entry.new(controller: "dashboards", action: "front", lastmod: newest_work),
     Entry.new(controller: "action_works", action: "index", lastmod: newest_work(ActionWork)),
     Entry.new(controller: "visual_works", action: "index", lastmod: newest_work(VisualWork)),
     Entry.new(controller: "dashboards", action: "about",
               lastmod: page_lastmod(Page::ABOUT_ID)),
     Entry.new(controller: "dashboards", action: "contact",
               lastmod: page_lastmod(Page::CONTACT_ID))]
  end

  def newest_work(scope = Work)
    scope.published.maximum(:updated_at)
  end

  # `find_by` rather than `Page.about`/`Page.contact`, which raise. Those pages'
  # own actions do raise, and should: without the row there is no page to
  # render. This is a document a crawler fetches, and it can go on naming forty
  # other URLs without one of them carrying a date.
  def page_lastmod(id)
    Page.find_by(id:)&.updated_at
  end

  # `ordered`, so the sitemap lists the works in the order the site itself
  # does. Nothing translated is read from these — `to_param` reads the
  # `slug_ca`/`slug_es`/`slug_en` columns — so there is nothing to eager load.
  #
  # A work's own `updated_at` is the whole of its page's date because
  # everything that page renders touches it: its translated title and
  # description are `action_text_rich_texts` rows, and those touch the record
  # they belong to, and its sections and images say `belongs_to :work, touch:
  # true` for the sake of the fragment cache. What it does not include is the
  # related works listed at the foot of the page. That is deliberate — see the
  # note on `tag_entries` for where the line falls.
  def work_entries
    Work.published.ordered.map do |work|
      Entry.new(controller: work.model_name.route_key,
                action: "show",
                record: work,
                lastmod: work.updated_at)
    end
  end

  # `enabled` is already "has at least one published work", which is the same
  # question the menu asks: a tag whose every work is a draft leads to an empty
  # page and does not belong in a sitemap any more than in the navigation.
  #
  # Two dates, because a tag page is its name and the works under it, and the
  # tag row only answers for the first: renaming a tag touches it, and so does
  # tagging or untagging a work, since `Tagging` says `touch: true` — but a
  # tagged work's own title changing does not.
  #
  # This is where the line falls, and it is the same line a work's page is on
  # the other side of. A date answers for what a page is *about*: the works are
  # what a tag page is, and the related works at the foot of a work's page are
  # not what that page is. Following every cross-link would end with every date
  # on the site moving whenever any one of them did, which tells a crawler
  # exactly as much as no dates would.
  def tag_entries
    newest = newest_work_by_tag

    Tag.enabled.map do |tag|
      Entry.new(controller: "tags",
                action: "show",
                record: tag,
                lastmod: [tag.updated_at, newest[tag.id]].compact.max)
    end
  end

  # One query for every tag rather than one each, keyed by tag id. Qualified,
  # because `taggings` carries an `updated_at` of its own that would otherwise
  # make the column ambiguous.
  def newest_work_by_tag
    Work.published.joins(:taggings).group("taggings.tag_id").maximum("works.updated_at")
  end
end
