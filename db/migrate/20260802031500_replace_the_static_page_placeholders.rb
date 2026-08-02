# frozen_string_literal: true

# The two static pages still carry the words the legacy app's `db/seeds.rb`
# created them with in 2012: `Page.create([{title: "About", body: "The
# about-page"}, {title: "Contact", body: "The contact-page"}])`. The About body
# was written over with a real biography years ago and is left alone here;
# everything else is still the placeholder.
#
# Two things follow from that. The About page renders its stored title, so its
# heading reads "About" in all three locales while the navigation item next to
# it reads "Bio" — the titles become what `menu.about` and `menu.contact`
# already say the pages are called. And the Contact page has never had content
# at all: "The contact-page", in Catalan only, on a row nothing rendered. Its
# body becomes the contact description the site already publishes in
# `meta.descriptions.contact`, which is the wording written for this page — not
# something invented here — and the two missing locales are created.
#
# Every change is guarded on the placeholder still being there, so a page the
# admin has since written for keeps what it says.
class ReplaceTheStaticPagePlaceholders < ActiveRecord::Migration[8.1]
  ABOUT_ID = 1
  CONTACT_ID = 2

  # A literal rather than `Time.current`, so restoring db/dump.sql and running
  # this migration produce byte-identical rows.
  WRITTEN_AT = "2026-08-02 03:15:00"

  PLACEHOLDERS = [
    { record_id: ABOUT_ID,   name: "title", locale: "ca", was: "About" },
    { record_id: ABOUT_ID,   name: "title", locale: "es", was: "About" },
    { record_id: ABOUT_ID,   name: "title", locale: "en", was: "About" },
    { record_id: CONTACT_ID, name: "title", locale: "ca", was: "Contact" },
    { record_id: CONTACT_ID, name: "title", locale: "es", was: nil },
    { record_id: CONTACT_ID, name: "title", locale: "en", was: nil },
    { record_id: CONTACT_ID, name: "body",  locale: "ca", was: "The contact-page" },
    { record_id: CONTACT_ID, name: "body",  locale: "es", was: nil },
    { record_id: CONTACT_ID, name: "body",  locale: "en", was: nil }
  ].freeze

  # `title` is a plain attribute and `body` a rich text one, which is why only
  # the second is markup — see "Rich text" in CLAUDE.md.
  REPLACEMENTS = {
    [ABOUT_ID, "title", "ca"] => "Bio",
    [ABOUT_ID, "title", "es"] => "Bio",
    [ABOUT_ID, "title", "en"] => "Bio",
    [CONTACT_ID, "title", "ca"] => "Contacte",
    [CONTACT_ID, "title", "es"] => "Contacto",
    [CONTACT_ID, "title", "en"] => "Contact",
    [CONTACT_ID, "body", "ca"] =>
      "<p>Escriu a Mireia Zantop sobre encàrrecs, exposicions i col·laboracions.</p>",
    [CONTACT_ID, "body", "es"] =>
      "<p>Escribe a Mireia Zantop sobre encargos, exposiciones y colaboraciones.</p>",
    [CONTACT_ID, "body", "en"] =>
      "<p>Write to Mireia Zantop about commissions, exhibitions and collaborations.</p>"
  }.freeze

  def up
    PLACEHOLDERS.each do |row|
      written = REPLACEMENTS.fetch([row[:record_id], row[:name], row[:locale]])

      row[:was] ? replace(row, row[:was], written) : insert(row, written)
    end
  end

  def down
    PLACEHOLDERS.each do |row|
      written = REPLACEMENTS.fetch([row[:record_id], row[:name], row[:locale]])

      row[:was] ? replace(row, written, row[:was]) : remove(row, written)
    end
  end

  private

  def replace(row, from, to)
    execute(<<~SQL.squish)
      UPDATE action_text_rich_texts
      SET body = #{quote(to)}, updated_at = #{quote(WRITTEN_AT)}
      WHERE #{identity(row)} AND body = #{quote(from)}
    SQL
  end

  # The locale is missing rather than wrong, so this creates it — unless the
  # admin got there first, which the migration has no business overwriting.
  def insert(row, body)
    execute(<<~SQL.squish)
      INSERT INTO action_text_rich_texts (name, body, record_type, record_id, locale,
                                          created_at, updated_at)
      SELECT #{quote(row[:name])}, #{quote(body)}, 'Page', #{quote(row[:record_id])},
             #{quote(row[:locale])}, #{quote(WRITTEN_AT)}, #{quote(WRITTEN_AT)}
      WHERE NOT EXISTS (SELECT 1 FROM action_text_rich_texts WHERE #{identity(row)})
    SQL
  end

  def remove(row, body)
    execute("DELETE FROM action_text_rich_texts WHERE #{identity(row)} AND body = #{quote(body)}")
  end

  def identity(row)
    <<~SQL.squish
      record_type = 'Page'
      AND record_id = #{quote(row[:record_id])}
      AND name = #{quote(row[:name])}
      AND locale = #{quote(row[:locale])}
    SQL
  end
end
