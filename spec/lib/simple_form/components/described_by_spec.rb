# frozen_string_literal: true

# SimpleForm marks an invalid field `aria-invalid` and then leaves the message
# beside it unconnected, and does the same with a hint. These three components
# replace `:error` and `:hint` in the wrappers so the field points at both.
#
# A view spec because the components only exist inside a rendered form: they
# are mixed into SimpleForm's input, and what they do is edit the attributes of
# markup two other components emit.
RSpec.describe SimpleForm::Components::DescribedBy, type: :view do
  # A model that exists only here. These examples need one field with one
  # validation on it and nothing else, and the app's own form objects all carry
  # a table and a dozen attributes that would be noise around the one thing
  # being asserted.
  before do
    stub_const("Thing", Class.new {
      include ActiveModel::Model

      attr_accessor :email

      validates :email, presence: true
    })
  end

  # Inline rather than a template of its own: the subject is one input in one
  # wrapper, and the app has no view that renders one on its own.
  def form_for(record, **input_options)
    render inline: <<~ERB, locals: { record:, input_options: } # rubocop:disable Rails/RenderInline
      <%= simple_form_for record, url: "/" do |f| %>
        <%= f.input :email, **input_options %>
      <% end %>
    ERB

    Nokogiri::HTML5.fragment(rendered)
  end

  def described_ids(form, field = "thing_email")
    form.css("##{field}").first["aria-describedby"].to_s.split
  end

  describe "#describedby" do
    it "leaves a field with nothing to say about it undescribed" do
      form = form_for(Thing.new)

      expect(form.css("#thing_email").first["aria-describedby"]).to be_nil
    end

    it "points an invalid field at its error" do
      form = form_for(Thing.new.tap(&:valid?))

      expect(described_ids(form).map { |id| form.css("##{id}").text })
        .to eq [I18n.t("errors.messages.blank")]
    end

    it "points a hinted field at its hint" do
      form = form_for(Thing.new, hint: "Una nota")

      expect(described_ids(form).map { |id| form.css("##{id}").text })
        .to eq ["Una nota"]
    end

    # Both at once, in reading order: what the field is for, then what is wrong
    # with what was typed into it.
    it "points a field that has both at both" do
      form = form_for(Thing.new.tap(&:valid?), hint: "Una nota")

      expect(described_ids(form).map { |id| form.css("##{id}").text })
        .to eq ["Una nota", I18n.t("errors.messages.blank")]
    end

    it "keeps marking the field invalid, which is the half SimpleForm already did" do
      form = form_for(Thing.new.tap(&:valid?))

      expect(form.css("#thing_email").first["aria-invalid"]).to eq "true"
    end
  end

  describe "#described_error" do
    it "keeps the class the stylesheet colours the message with" do
      form = form_for(Thing.new.tap(&:valid?))

      expect(form.css("span.help-inline").text).to eq I18n.t("errors.messages.blank")
    end

    it "escapes a message rather than rendering it" do
      thing = Thing.new
      thing.errors.add(:email, "<b>malament</b>")

      expect(form_for(thing).css("span.help-inline").text).to eq "<b>malament</b>"
    end
  end

  describe "#described_hint" do
    it "keeps the class and the tag the hint has always had" do
      form = form_for(Thing.new, hint: "Una nota")

      expect(form.css("p.help-block").text).to eq "Una nota"
    end
  end
end
