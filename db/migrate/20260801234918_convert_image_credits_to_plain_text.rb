# frozen_string_literal: true

# Image#credits stops being a rich text attribute and becomes a plain one — see
# "Rich text" in CLAUDE.md for why. Mobility stores both kinds in
# action_text_rich_texts, so no column moves; what changes is that the body of
# these rows must now be the text itself rather than markup, because a plain
# attribute is read back as a String and escaped on output.
#
# The 197 rows hold photo credits and short poems. Their markup is only <p>,
# <div> and <br>, all of which mean "line break here", plus two <strong> spans
# around a work title. The bold is dropped — a caption inside a <figcaption> has
# no way to express it any more — and everything else survives as line breaks,
# which is what the poems need.
class ConvertImageCreditsToPlainText < ActiveRecord::Migration[8.1]
  # Control characters, so a break marker can never collide with the text around
  # it the way a printable sentinel could. Written as escapes rather than
  # literal bytes: a literal NUL in the source makes git treat this whole
  # file as binary, so it would never show a diff again.
  LINE_BREAK = "\u0000"
  PARAGRAPH_BREAK = "\u0001"
  NO_BREAK_SPACE = "\u00A0"

  def up
    each_credit { |id, body| update_body(id, html_to_text(body)) }
  end

  # Wrapping each paragraph back up is what the editor would have produced, so
  # the rows return as valid rich text. The two <strong> spans are not restored:
  # they are gone by then.
  def down
    each_credit { |id, body| update_body(id, text_to_html(body)) }
  end

  private

  def each_credit
    rows = select_all(<<~SQL.squish)
      SELECT id, body FROM action_text_rich_texts
      WHERE record_type = 'Image' AND name = 'credits'
    SQL

    rows.each { |row| yield row["id"], row["body"].to_s }
  end

  def update_body(id, body)
    execute("UPDATE action_text_rich_texts SET body = #{quote(body)} WHERE id = #{quote(id)}")
  end

  # <br> and the end of a <p>/<div> are the only breaks that mean anything here;
  # every other run of whitespace in the stored markup is HTML source
  # formatting. The rows are full of CRLFs and indenting tabs between a <br> and
  # the line it breaks, so those have to collapse the way a browser collapses
  # them — otherwise every line of a poem gains a blank line and a leading tab.
  def html_to_text(html)
    marked = html.gsub(%r{<br\s*/?>}i, LINE_BREAK)
                 .gsub(%r{</(?:p|div)>}i, PARAGRAPH_BREAK)
                 .gsub(/<[^>]+>/, "")
    # &nbsp; was used as a spacer, and reads as a blank line once collapsed.
    text = CGI.unescapeHTML(marked).tr(NO_BREAK_SPACE, " ")
    text.gsub(/[[:space:]]+/, " ")
        .gsub(/ ?#{LINE_BREAK} ?/o, "\n")
        .gsub(/ ?#{PARAGRAPH_BREAK} ?/o, "\n\n")
        .gsub(/\n{3,}/, "\n\n")
        .strip
  end

  def text_to_html(text)
    return "" if text.blank?

    text.split(/\n{2,}/).map { |paragraph|
      lines = ERB::Util.html_escape(paragraph).gsub("\n", "<br>")
      "<p>#{lines}</p>"
    }.join
  end
end
