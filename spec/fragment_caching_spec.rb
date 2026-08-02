# frozen_string_literal: true

# Every public page that costs anything to build is wrapped in a `cache` block,
# and a fragment is only ever as correct as its key. The environment decides
# whether caching happens at all — off in test, on in production — so these
# examples turn it on for themselves: against the `:null_store` the test
# environment configures, every one of them would pass without ever proving a
# thing.
#
# The shape is always the same: render, change something the fragment shows,
# render again with a freshly loaded record, and expect the change on the page.
RSpec.describe "fragment caching", type: :view do
  # Set on the class rather than on `controller`, which does not exist yet when
  # an `around` hook starts, and in locals rather than in instance variables,
  # which a view spec hands to the template as assigns.
  around do |example|
    test_controller = ActionView::TestCase::TestController
    store = test_controller.cache_store
    caching = test_controller.perform_caching

    test_controller.cache_store = :memory_store
    test_controller.perform_caching = true

    example.run
  ensure
    test_controller.cache_store = store
    test_controller.perform_caching = caching
  end

  def attach(image, filename)
    image.image.attach(io: Rails.root.join("spec/fixtures/files/test_image.png").open,
                       filename:,
                       content_type: "image/png")
  end

  # The template is shared by both work controllers; the path parameters stand
  # in for whichever one is rendering it, as they do in the works/show spec.
  def render_show(work)
    controller.request.path_parameters.merge!(controller: "action_works",
                                              action: "show",
                                              locale: "ca",
                                              id: work.to_param)
    assign(:work, work)
    assign(:related_works, work.related)

    render template: "works/show"
  end

  # The related works are yielded to the layout, which a view spec does not
  # render, so they have to be read back out of the buffer they are filled in
  # to. `content_for` appends, so this grows with every render in an example.
  def render_sidebar(work)
    render_show(work)

    view.content_for(:sidebar)
  end

  def render_preview(work)
    render partial: "works/work_preview", locals: { work: }
  end

  def render_dashboard(works)
    render partial: "dashboards/works", locals: { works: }
  end

  def render_tag(tag)
    controller.request.path_parameters.merge!(controller: "tags",
                                              action: "show",
                                              locale: "ca",
                                              id: tag.to_param)
    assign(:category, tag)
    # `@works`, and `visible` rather than `published`, to match what
    # `TagsController#show` assigns. Nothing here signs in, so `Current.user`
    # is nil and `visible` resolves to `published` anyway.
    assign(:works, tag.works.visible.ordered)

    render template: "tags/show"
  end

  describe "works/show" do
    it "shows an edited section body" do
      work = create(:action_work)
      section = create(:section, work:, body: "First draft")
      render_show(work.reload)

      section.update!(body: "Second draft")

      expect(render_show(work.reload)).to include("Second draft")
    end

    it "shows an edited section title" do
      work = create(:action_work)
      section = create(:section, work:, title: "Old heading")
      render_show(work.reload)

      section.update!(title: "New heading")

      expect(render_show(work.reload)).to include("New heading")
    end

    it "shows a section that has been destroyed as gone" do
      work = create(:action_work)
      section = create(:section, work:, body: "Doomed paragraph")
      render_show(work.reload)

      section.destroy!

      expect(render_show(work.reload)).not_to include("Doomed paragraph")
    end

    it "shows an image added after the page was first rendered" do
      work = create(:action_work, images: [build(:image, credits: "First photo")])
      render_show(work.reload)

      create(:image, work:, credits: "Second photo")

      expect(render_show(work.reload)).to include("Second photo")
    end

    it "shows a destroyed image as gone" do
      work = create(:action_work, images: [build(:image, credits: "Kept photo")])
      doomed = create(:image, work:, credits: "Doomed photo")
      render_show(work.reload)

      doomed.destroy!

      expect(render_show(work.reload)).not_to include("Doomed photo")
    end

    it "shows reordered images in their new order" do
      work = create(:action_work)
      first = create(:image, work:, credits: "Lead photo", position: 1)
      create(:image, work:, credits: "Trailing photo", position: 2)
      render_show(work.reload)

      first.update!(position: 3)

      rendered = render_show(work.reload)
      expect(rendered.index("Trailing photo")).to be < rendered.index("Lead photo")
    end

    it "shows edited image credits" do
      work = create(:action_work)
      image = create(:image, work:, credits: "Photo: nobody")
      render_show(work.reload)

      image.update!(credits: "Photo: somebody")

      expect(render_show(work.reload)).to include("Photo: somebody")
    end

    it "shows a replaced image file" do
      work = create(:action_work)
      image = create(:image, work:)
      render_show(work.reload)

      attach(image, "replacement.png")

      expect(render_show(work.reload)).to include("replacement.png")
    end

    it "shows a tag added after the page was first rendered" do
      work = create(:action_work)
      render_show(work.reload)

      work.tags << create(:tag, name: "gravat")

      expect(render_show(work.reload)).to include("gravat")
    end

    it "shows a tag removed after the page was first rendered" do
      work = create(:action_work, tags: [create(:tag, name: "gravat")])
      render_show(work.reload)

      work.taggings.destroy_all

      expect(render_show(work.reload)).not_to include("gravat")
    end

    it "shows a renamed tag under its new name" do
      work = create(:action_work, tags: [create(:tag, name: "gravat")])
      render_show(work.reload)

      work.tags.first.update!(name: "dibuix")

      expect(render_show(work.reload)).to include("dibuix")
    end

    it "shows a renamed related work under its new title" do
      tag = create(:tag, name: "gravat")
      work = create(:action_work, tags: [tag])
      related = create(:action_work, title: "Old neighbour", tags: [tag])
      render_sidebar(work.reload)

      related.update!(title: "New neighbour")

      expect(render_sidebar(work.reload)).to include("New neighbour")
    end
  end

  describe "works/_work_preview" do
    it "shows a replaced first image" do
      work = create(:action_work)
      image = create(:image, work:)
      render_preview(work.reload)

      attach(image, "replacement.png")

      expect(render_preview(work.reload)).to include("replacement.png")
    end

    it "shows the first image of a work that had none" do
      work = create(:action_work)
      render_preview(work.reload)

      create(:image, work:, filename: "test_image.png")

      expect(render_preview(work.reload)).not_to include("mz-comodin")
    end
  end

  describe "dashboards/_works" do
    it "shows a replaced first image" do
      work = create(:action_work)
      image = create(:image, work:)
      render_dashboard([work.reload])

      attach(image, "replacement.png")

      expect(render_dashboard([work.reload])).to include("replacement.png")
    end
  end

  describe "tags/show" do
    it "shows an edited work title" do
      tag = create(:tag, name: "gravat")
      work = create(:action_work, title: "Old title", tags: [tag])
      render_tag(tag.reload)

      work.update!(title: "New title")

      expect(render_tag(tag.reload)).to include("New title")
    end

    it "shows a work that has left the tag as gone" do
      tag = create(:tag, name: "gravat")
      work = create(:action_work, title: "Departing work", tags: [tag])
      render_tag(tag.reload)

      work.taggings.destroy_all

      expect(render_tag(tag.reload)).not_to include("Departing work")
    end

    # `Work.reposition` deliberately skips `updated_at`, so no timestamp on any
    # work or on the tag moves when the admin drags the front page into a new
    # order — and this list is rendered in that order.
    it "shows reordered works in their new order" do
      tag = create(:tag, name: "gravat")
      first = create(:action_work, title: "Leading work", tags: [tag])
      second = create(:action_work, title: "Trailing work", tags: [tag])
      render_tag(tag.reload)

      Work.reposition([first.id, second.id].map(&:to_s))

      rendered = render_tag(tag.reload)
      expect(rendered.index("Leading work")).to be < rendered.index("Trailing work")
    end
  end
end
