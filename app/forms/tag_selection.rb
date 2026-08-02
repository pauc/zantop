# frozen_string_literal: true

# The tag picker's half of a work form: reading the work's tags as the
# `[id, name]` pairs tom-select wants, and turning what comes back into tag
# ids — creating a `Tag` for any entry the admin typed rather than picked.
#
# Split out of `WorkForm` because it shares nothing with the rest of it: the
# form's other work is translations and nested sections and images.
module TagSelection
  def tags
    work
      .tags
      .includes(:plain_text_translations)
      .map { |tag| [tag.id, tag.name] }
  end

  # An entry that parses as an integer is an existing tag; anything else is a
  # name the admin typed into the picker, and becomes a tag before it can be
  # assigned.
  def tags=(ids)
    ids, new_tags = ids
                    .compact_blank
                    .partition { |id| Integer(id, exception: false) }

    new_tags.each { |tag_name| ids << Tag.create(name: tag_name).id }

    work.tag_ids = ids
  end

  def tag_options
    Tag
      .includes(:plain_text_translations)
      .map { |tag| [tag.id, tag.name] }
  end
end
