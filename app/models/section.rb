# frozen_string_literal: true

class Section < ApplicationRecord
  include HasTranslations

  translates :title, plain: true
  translates :body

  # `touch` because the work's page is cached on the work alone, and a section
  # is rendered inside that fragment: without it, editing a section leaves the
  # page it appears on serving the previous draft. It reaches further than a
  # section's own columns — the Mobility ActionText backend keeps `title` and
  # `body` in `action_text_rich_texts` rows that touch the section they belong
  # to, and that touch is what propagates from here.
  belongs_to :work, touch: true

  validates :body, presence: true
end
