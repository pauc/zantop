# frozen_string_literal: true

RSpec.describe Sitemap do
  def entries
    described_class.new.entries
  end

  def routes
    entries.map(&:path_parameters)
  end

  # What is listed, as [controller, record], for the entries that name one.
  def listed
    entries.filter_map { |entry| [entry.controller, entry.record] if entry.record }
  end

  describe "#entries" do
    it "names every page that is a route and nothing else, in the menu's order" do
      expect(routes).to eq [{ controller: "dashboards",       action: "front" },
                            { controller: "action_works",     action: "index" },
                            { controller: "visual_works",     action: "index" },
                            { controller: "dashboards",       action: "about" },
                            { controller: "contact_messages", action: "new" }]
    end

    it "names each work under the controller that serves its subclass" do
      visual = create(:visual_work)
      action = create(:action_work)

      expect(listed).to contain_exactly(["visual_works", visual], ["action_works", action])
    end

    it "lists the works in the order the site itself does" do
      first  = create(:action_work, position: 1)
      second = create(:visual_work, position: 2)

      expect(listed.map(&:last)).to eq [second, first]
    end

    it "leaves out an unpublished work" do
      create(:visual_work, published: false)

      expect(listed).to be_empty
    end

    # The one that `Work.visible` would get wrong: it answers according to
    # `Current.user`, so the owner fetching the sitemap while signed in would
    # be handed her drafts — and hand them on to whatever cached the response.
    it "leaves out an unpublished work even when the owner is the one asking" do
      create(:visual_work, published: false)

      Current.set(user: create(:user)) do
        expect(listed).to be_empty
      end
    end

    it "names every tag with something published under it" do
      tag = create(:tag, name: "pintura")
      create(:visual_work).tags << tag

      expect(listed).to include(["tags", tag])
    end

    it "leaves out a tag whose works are all drafts" do
      tag = create(:tag, name: "esbossos")
      create(:visual_work, published: false).tags << tag

      expect(listed.map(&:first)).not_to include "tags"
    end

    it "leaves out a tag with no works at all" do
      create(:tag, name: "buida")

      expect(listed.map(&:first)).not_to include "tags"
    end

    it "names a tag once however many works carry it" do
      tag = create(:tag, name: "pintura")
      create(:visual_work).tags << tag
      create(:action_work).tags << tag

      expect(listed.count { |controller, _| controller == "tags" }).to eq 1
    end
  end
end
