# frozen_string_literal: true

# The two static pages are rows that have always existed, identified by their
# id: the About page is 1 and the Contact page is 2. Nothing creates or
# destroys them; the admin only edits their translated title and body.
class Page < ApplicationRecord
  include HasTranslations

  ABOUT_ID = 1
  CONTACT_ID = 2

  translates :title, plain: true
  translates :body

  validates :title, presence: true
  validates :body, presence: true

  def self.about
    find(ABOUT_ID)
  end

  def self.contact
    find(CONTACT_ID)
  end

  def about?
    id == ABOUT_ID
  end

  def contact?
    id == CONTACT_ID
  end
end
