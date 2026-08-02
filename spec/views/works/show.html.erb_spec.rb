# frozen_string_literal: true

RSpec.describe "works/show", type: :view do
  # The template is shared by both work controllers, so the path parameters
  # decide which one it is standing in for. The admin bar it fills in is
  # yielded by the layout, which view specs do not render.
  def render_work(work, controller_name = "action_works")
    controller.request.path_parameters.merge!(controller: controller_name,
                                              action: "show",
                                              locale: "ca",
                                              id: work.to_param)
    assign(:work, work)
    assign(:related_works, [])

    render

    rendered
  end

  def admin_bar_for(work, controller_name)
    render_work(work, controller_name)

    view.content_for(:admin_bar_second_row)
  end

  it "deletes a visual work through the visual works route" do
    work = create(:visual_work)

    expect(admin_bar_for(work, "visual_works"))
      .to include %(action="#{visual_work_path(work)}")
  end

  it "deletes an action work through the action works route" do
    work = create(:action_work)

    expect(admin_bar_for(work, "action_works"))
      .to include %(action="#{action_work_path(work)}")
  end

  it "deletes with a form, so it does not need rails-ujs to pick the verb" do
    work = create(:visual_work)

    expect(admin_bar_for(work, "visual_works"))
      .to include %(name="_method" value="delete")
  end

  it "asks for confirmation before deleting" do
    work = create(:visual_work)

    expect(admin_bar_for(work, "visual_works"))
      .to include %(data-confirm="Segur que ho vols esborrar?")
  end

  describe "the metadata it declares for the layout" do
    it "titles the document with the work" do
      render_work(create(:action_work, title: "Tot Fluxus"))

      expect(view.content_for(:title)).to eq "Tot Fluxus"
    end

    it "describes it with the work's own description rather than a template" do
      work = create(:action_work, description: "<p>Una acció <strong>compartida</strong></p>")

      render_work(work)

      expect(view.content_for(:meta_description)).to eq "Una acció compartida"
    end

    # Most works have a description; the few that do not still have a name.
    it "falls back to the title when the work has no description" do
      work = create(:action_work, title: "Flux", description: nil)

      render_work(work)

      expect(view.content_for(:meta_description))
        .to eq I18n.t("meta.descriptions.work", work: "Flux")
    end

    it "previews with the work's first image" do
      work = create(:action_work, images: [build(:image)])

      render_work(work)

      expect(view.content_for(:meta_image))
        .to eq view.rails_representation_url(work.first_image(:large))
    end

    it "leaves the image out for a work that has none, so the site image stands in" do
      render_work(create(:action_work))

      expect(view.content_for(:meta_image)).to be_blank
    end

    it "points the canonical at the slug of the locale being rendered" do
      work = create(:visual_work, title: "Procés in solid")
      I18n.with_locale(:en) { work.update!(title: "Petra Perta") }

      render_work(work, "visual_works")

      expect(view.content_for(:meta_canonical))
        .to eq "http://test.host/ca/art-visual/proces-in-solid"
    end

    it "offers the other locales under their own slugs" do
      work = create(:visual_work, title: "Procés in solid")
      I18n.with_locale(:en) { work.update!(title: "Petra Perta") }

      render_work(work, "visual_works")

      expect(view.content_for(:meta_alternates))
        .to include %(hreflang="en" href="http://test.host/en/visual-art/petra-perta")
    end

    it "is an article rather than a section of the site" do
      render_work(create(:action_work))

      expect(view.content_for(:meta_type)).to eq "article"
    end
  end

  describe "the gallery" do
    it "shows one for a work that has images" do
      work = create(:action_work, images: [build(:image)])

      expect(render_work(work)).to include "data-gallery"
    end

    # The partial would still emit its container, its lightbox and its empty
    # tracks, so the page has to decide rather than the gallery itself.
    it "leaves out the empty scaffolding when the work has no images" do
      expect(render_work(create(:action_work))).not_to include "data-gallery"
    end
  end
end
