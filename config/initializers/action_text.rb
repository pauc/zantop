# frozen_string_literal: true

# The one authoritative list of markup this site renders.
#
# ActionText sanitizes on *render*, not on write, so this is a guarantee about
# what can ever reach a page — independent of what is stored, who stored it, or
# which editor produced it. The Trix configuration in app/javascript/admin/
# rich-text.js keeps the editor from *producing* anything else; this keeps
# anything else from being *displayed*. Neither one alone is enough: Trix runs
# on the client and can be bypassed, and sanitizing on render leaves the editor
# free to offer formatting the site would silently drop.
#
# The set is deliberately small, and matches what the content actually uses:
#
#   div     Trix's default block. Trix 2 wraps every plain paragraph in a
#           <div>, so dropping this would collapse newly edited text into a
#           single run. Styled as a paragraph in richtext.scss.
#   p       the same thing in content migrated from the old Rails 3.2 app,
#           which used a different editor.
#   br      soft line breaks, which the poetry in the descriptions relies on.
#   strong  emphasis.
#   em      emphasis. Unused so far, but the editor offers italics and titles
#           of works and exhibitions want them.
#   a       links to collaborators and videos.
#
# Everything else is unwrapped on render, keeping its text: headings, lists,
# blockquotes, <pre>, <del>, and ActionText attachments (<figure>,
# <action-text-attachment>). Nothing in the database uses any of them.
#
# See "Rich text" in CLAUDE.md before widening this.
ActionText::ContentHelper.allowed_tags = %w[div p br strong em a].freeze

# href is the only attribute any of the above needs. The sanitizer still scrubs
# javascript: and data: URIs out of it.
ActionText::ContentHelper.allowed_attributes = %w[href].freeze
