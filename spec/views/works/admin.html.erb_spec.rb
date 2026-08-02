# frozen_string_literal: true

# A view spec rather than render_views on the controller: the application
# layout calls javascript_include_tag and the Run tests workflow never builds
# the bundles, so anything that renders the layout passes locally and fails on
# the pull request.
RSpec.describe "works/admin", type: :view do
  def render_works(*works)
    assign(:works, works)

    render
  end

  # Mobility's ActionText backend writes a translation row per locale, so a
  # work is translated into exactly the locales it was given a title in.
  def translated_into(*locales)
    work = build(:visual_work)
    locales.each { |locale| I18n.with_locale(locale) { work.title = "Títol #{locale}" } }
    work.save!
    work
  end

  it "lists every work" do
    render_works(create(:visual_work, title: "Retrat"), create(:action_work, title: "Marxa"))

    expect(rendered).to include "Retrat", "Marxa"
  end

  it "hands the sortable list the endpoint the reorder is sent to" do
    render_works(create(:visual_work))

    expect(rendered).to include %(data-url="#{sort_works_path}")
  end

  it "tags each item with its work id, which is what the reorder sends" do
    work = create(:visual_work)

    render_works(work)

    expect(rendered).to include %(data-id="#{work.id}")
  end

  it "gives every work a control to move it up and one to move it down" do
    render_works(create(:visual_work), create(:visual_work))

    expect(rendered.scan(/data-behaviour="move-(up|down)"/).flatten)
      .to eq %w[up down up down]
  end

  # The label carries the title because a screen reader reads the controls of a
  # list out of the row they sit in: twenty rows of "move up" say nothing.
  it "names the work each control moves" do
    render_works(create(:visual_work, title: "Retrat"))

    expect(rendered).to include %(aria-label="Mou «Retrat» amunt"),
                                %(aria-label="Mou «Retrat» avall")
  end

  # Where a work landed and whether the order was saved. Both are announced
  # rather than only painted, so the reorder is followable without the screen.
  it "carries a live region for the new position and another for the save" do
    render_works(create(:visual_work))

    expect(rendered).to include %(role="status" data-behaviour="sorting-position"),
                                %(role="status" data-behaviour="sorting-save")
  end

  it "marks an unpublished work" do
    render_works(create(:visual_work, published: false))

    expect(rendered).to include "(no publicat)"
  end

  it "leaves a published work unmarked" do
    render_works(create(:visual_work, published: true))

    expect(rendered).not_to include "(no publicat)"
  end

  it "flags the locales a work has no translation in" do
    render_works(translated_into(:ca))

    expect(rendered.scan(/class="(translated|untranslated)"/).flatten)
      .to eq %w[translated untranslated untranslated]
  end

  it "flags nothing on a work translated into every locale" do
    render_works(translated_into(:ca, :es, :en))

    expect(rendered).not_to include "untranslated"
  end

  it "edits a visual work through the visual works route" do
    work = create(:visual_work)

    render_works(work)

    expect(rendered).to include %(href="#{edit_visual_work_path(work)}")
  end

  it "edits an action work through the action works route" do
    work = create(:action_work)

    render_works(work)

    expect(rendered).to include %(href="#{edit_action_work_path(work)}")
  end
end
