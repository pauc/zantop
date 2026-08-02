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

  # `updated_at` is only worth publishing if it moves for everything that
  # changes the page, so the ones that read as tests of Active Record — a
  # section, an image — are the point rather than incidental: they are what
  # decides whether the field may be there at all.
  describe "the date on an entry" do
    def lastmod(controller, action)
      entries.find { |entry| entry.controller == controller && entry.action == action }.lastmod
    end

    def lastmod_for(record)
      entries.find { |entry| entry.record == record }.lastmod
    end

    # As Postgres kept it: a Ruby `Time` carries nanoseconds that a timestamp
    # column does not, so a record fresh from `create` never equals the date
    # the sitemap read back out of the database.
    def stored(record)
      record.reload.updated_at
    end

    # Nothing here can wait a second for the clock, so the date under test is
    # pushed into the past and the question is whether it came back.
    def backdate(record)
      record.update!(updated_at: 1.day.ago)
      stored(record)
    end

    it "dates a work by its own timestamp" do
      work = create(:visual_work)

      expect(lastmod_for(work)).to eq stored(work)
    end

    it "moves a work's date when its own text changes" do
      work = create(:visual_work)
      was = backdate(work)

      work.update!(title: "Petra Perta")

      expect(lastmod_for(work)).to be > was
    end

    it "moves a work's date when one of its sections changes" do
      work = create(:visual_work)
      section = create(:section, work:)
      was = backdate(work)

      section.update!(body: "Un altre text")

      expect(lastmod_for(work)).to be > was
    end

    it "moves a work's date when one of its images changes" do
      work = create(:visual_work)
      image = create(:image, work:)
      was = backdate(work)

      image.update!(credits: "foto: algú altre")

      expect(lastmod_for(work)).to be > was
    end

    # `Work.reposition` skips `updated_at` on purpose, and for a lastmod that
    # is the right answer rather than the defect it would be elsewhere:
    # reordering the front page changes no work's content, and the sitemap
    # makes no claim about the order it lists them in.
    it "leaves a work's date alone when the works are only reordered" do
      first  = create(:action_work, position: 1)
      second = create(:visual_work, position: 2)
      was = backdate(first)

      Work.reposition([first.id, second.id])

      expect(lastmod_for(first)).to eq was
    end

    it "dates the front page by the newest work it lists" do
      create(:action_work).update!(updated_at: 1.day.ago)
      newest = create(:visual_work)

      expect(lastmod("dashboards", "front")).to eq stored(newest)
    end

    it "dates each index by the newest work of its own kind" do
      action = create(:action_work)
      visual = create(:visual_work)
      action.update!(updated_at: 1.day.ago)

      expect(lastmod("action_works", "index")).to eq stored(action)
      expect(lastmod("visual_works", "index")).to eq stored(visual)
    end

    it "keeps a draft out of the date on a page that does not list it" do
      published = create(:visual_work)
      create(:visual_work, published: false)

      expect(lastmod("dashboards", "front")).to eq stored(published)
    end

    it "carries no date for a page with nothing listed on it yet" do
      expect(lastmod("dashboards", "front")).to be_nil
    end

    it "dates the About page by the row it renders" do
      page = create(:page)

      expect(lastmod("dashboards", "about")).to eq stored(page)
    end

    # The row has always existed, and the About page itself raises without it.
    # A sitemap is a document a crawler fetches, and it goes on describing
    # every other URL rather than failing over one missing date.
    it "carries no date for the About page when its row is not there" do
      expect(lastmod("dashboards", "about")).to be_nil
    end

    # It renders a form built from the template and the locale files. Neither
    # has a date to give, and the `Page` row the admin edits under that name is
    # not read by the action.
    it "carries no date for the contact form" do
      expect(lastmod("contact_messages", "new")).to be_nil
    end

    it "dates a tag by the newest work under it" do
      tag = create(:tag, name: "pintura")
      older = create(:visual_work)
      newest = create(:action_work)
      tag.works << older << newest
      backdate(older)
      # Tagging a work touches the tag, so the row is newer than either of them
      # until it is pushed back out of the way.
      backdate(tag)

      expect(lastmod_for(tag)).to eq stored(newest)
    end

    it "dates a tag by its own row when the name is what changed" do
      tag = create(:tag, name: "pintura")
      tag.works << create(:visual_work)
      tag.update!(name: "escultura")

      expect(lastmod_for(tag)).to eq stored(tag)
    end

    it "keeps a draft out of a tag's date" do
      tag = create(:tag, name: "pintura")
      published = create(:visual_work)
      tag.works << published
      tag.works << create(:action_work, published: false)
      tag.update!(updated_at: 1.day.ago)
      published.update!(updated_at: 1.hour.ago)

      expect(lastmod_for(tag)).to eq stored(published)
    end
  end
end
