# frozen_string_literal: true

# Moves a page reached by one of its other addresses to the one address it
# keeps.
#
# A work or a tag answers under more slugs than the one its links are written
# with: `HasSlugs` looks a record up across `slug_ca`, `slug_es` and `slug_en`,
# so the English slug resolves while the visitor is reading Catalan, and
# friendly_id's history table keeps every slug the record has ever had, so a
# renamed work still answers where it used to live. An id resolves too, which
# is how the admin's own redirects reach a work it has just saved. Each of them
# rendered the page in place: four live addresses in every locale before
# counting renames, for a search engine to pick between.
#
# The Rails 3.2 app answered 301 to all of them, in a `Finder` concern that did
# not survive the rewrite; this is that half of it back. What is canonical is
# `MetadataHelper`'s answer, the one the page's own `rel="canonical"` already
# names, so the redirect and the tag cannot send a crawler two different ways.
module CanonicalRedirect
  extend ActiveSupport::Concern

  private

  # Call this *after* the record is loaded, and only ever with a record the
  # visitor is allowed to have: `Work.visible_find` raises for a draft, and
  # redirecting ahead of it would answer 301 where an unknown slug answers 404,
  # which is enough to tell an anonymous visitor that the draft is there.
  #
  # Answers whether it moved the request, so the action can stop before doing
  # the rest of the work of a page nobody is going to be shown.
  def moved_to_canonical?(record)
    canonical = URI.parse(helpers.canonical_url(record))
    return false if canonical.path == request.path

    # The query string is no part of which address is canonical, and the
    # campaign parameter a visitor arrived with is worth as much on the address
    # they are moved to.
    canonical.query = request.query_string.presence

    redirect_to canonical.to_s, status: :moved_permanently

    true
  end
end
