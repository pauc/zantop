# frozen_string_literal: true

# SimpleForm marks an invalid field `aria-invalid` and then leaves the message
# beside it unconnected; it does the same with a hint. So a screen reader says
# a field is wrong without ever saying what is wrong with it, and never reads
# the "leave this blank to keep the current password" note at all. These
# components tie the three together with `aria-describedby`.
#
# Three components rather than one because the input renders before either
# message does: `describedby` runs first and only sets the attribute, and the
# other two render the text under the ids that attribute points at. They
# replace `:hint` and `:error` in the wrappers, whose `wrap_with:` is one
# static hash for every input and so cannot carry an id.
module SimpleForm
  module Components
    module DescribedBy
      def describedby(_wrapper_options = nil)
        ids = [(hint_id if has_hint?), (error_id if has_errors?)].compact
        input_html_options[:"aria-describedby"] = ids.join(" ") if ids.any?

        nil
      end

      def described_hint(_wrapper_options = nil)
        return unless has_hint?

        template.content_tag(:p, hint, class: "help-block", id: hint_id)
      end

      def described_error(_wrapper_options = nil)
        return unless has_errors?

        template.content_tag(:span, error_text, class: "help-inline", id: error_id)
      end

      private

      def hint_id
        described_id("hint")
      end

      def error_id
        described_id("error")
      end

      # The id Rails gives the input, with a suffix. `index` is what keeps the
      # two sections of one work apart — their field names are identical, and
      # an index is how Rails itself tells `[]` names from one another.
      def described_id(suffix)
        index = object.to_param if object_name.to_s.end_with?("[]")

        template.field_id(object_name, attribute_name, suffix, index:)
      end
    end
  end
end

SimpleForm::Inputs::Base.include SimpleForm::Components::DescribedBy
