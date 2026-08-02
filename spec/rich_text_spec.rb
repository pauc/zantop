# frozen_string_literal: true

# Guards the promise config/initializers/action_text.rb makes: a fixed, small
# set of markup is all that can ever reach a page, whatever is stored.
#
# The editor is configured to match, in app/javascript/admin/rich-text.js, but
# that runs on the client and this does not depend on it. Everything here goes
# in as raw stored markup — the shape a hand-written request, a paste Trix let
# through, or a row migrated from the old Rails 3.2 app would leave behind — and
# asserts what comes out the other side.
RSpec.describe "rendered rich text" do
  def render(html)
    work = create(:action_work)
    ActionText::RichText.find_or_initialize_by(record: work, name: "description", locale: "ca")
                        .tap { |rich_text| rich_text.update!(body: html) }

    work.reload.description.to_s
  end

  it "wraps the content in the hook the public stylesheet targets" do
    expect(render("<p>Una obra</p>")).to include %(<div class="trix-content">)
  end

  describe "the markup it keeps" do
    # <p> is what the content migrated from the old app uses and what Trix now
    # emits; <div> is Trix's untouched default, still in a few older rows.
    it "keeps both paragraph elements" do
      rendered = render("<p>Una</p><div>Dues</div>")

      expect(rendered).to include "<p>Una</p>"
      expect(rendered).to include "<div>Dues</div>"
    end

    it "keeps line breaks" do
      expect(render("<p>Una<br>Dues</p>")).to include "<br>"
    end

    it "keeps bold and italic" do
      expect(render("<p><strong>Una</strong> <em>dues</em></p>"))
        .to include("<strong>Una</strong>").and include("<em>dues</em>")
    end

    it "keeps links" do
      expect(render(%(<p><a href="https://denysblacker.com">Denys</a></p>)))
        .to include %(<a href="https://denysblacker.com">Denys</a>)
    end
  end

  describe "the markup it drops" do
    # Unwrapped, not pruned: the tag goes and its text stays, so narrowing the
    # allowed set can never silently delete someone's writing.
    {
      "headings" => ["<h1>Un títol</h1>", "Un títol", "h1"],
      "quotes" => ["<blockquote>Una cita</blockquote>", "Una cita", "blockquote"],
      "code" => ["<pre>Un codi</pre>", "Un codi", "pre"],
      "bullet lists" => ["<ul><li>Un punt</li></ul>", "Un punt", "ul"],
      "numbered lists" => ["<ol><li>Un punt</li></ol>", "Un punt", "ol"],
      "strikethrough" => ["<del>Un ratllat</del>", "Un ratllat", "del"]
    }.each do |name, (html, text, tag)|
      it "unwraps #{name}, keeping the text" do
        rendered = render(html)

        expect(rendered).to include text
        expect(rendered).not_to include "<#{tag}"
      end
    end

    it "drops attributes other than href" do
      rendered = render(%(<p class="lead" style="color: red">Una obra</p>))

      expect(rendered).to include "<p>Una obra</p>"
    end

    it "scrubs a javascript: link, keeping its text" do
      rendered = render(%(<p><a href="javascript:alert(1)">Clica</a></p>))

      expect(rendered).to include "Clica"
      expect(rendered).not_to include "javascript:"
    end
  end

  # The gallery is how images belong to a work; nothing embeds one in prose.
  # rich-text.js refuses the file so none can be attached, and this is what
  # makes that true of anything already stored or posted around the editor.
  it "does not render an ActionText attachment" do
    blob = ActiveStorage::Blob.create_and_upload!(
      io: Rails.root.join("spec/fixtures/files/test_image.png").open,
      filename: "test_image.png"
    )
    attachment = %(<action-text-attachment sgid="#{blob.attachable_sgid}"></action-text-attachment>)
    rendered = render("<figure>#{attachment}</figure>")

    expect(rendered).not_to include "action-text-attachment"
    expect(rendered).not_to include "<figure"
  end
end
