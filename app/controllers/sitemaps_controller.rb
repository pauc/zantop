# frozen_string_literal: true

# The one thing the site serves that is not a page: the list of every public
# URL, in all three locales, for crawlers. robots.txt points at it.
class SitemapsController < ApplicationController
  include Authorization

  allow_anonymous :show

  # `set_locale` bounces any request without a locale segment, and this route
  # deliberately has none — see the comment on it in config/routes.rb.
  # `set_tags` queries for a menu that belongs to a layout no sitemap renders.
  skip_before_action :set_locale, :set_tags

  def show
    @sitemap = Sitemap.new
  end
end
