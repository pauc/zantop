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
