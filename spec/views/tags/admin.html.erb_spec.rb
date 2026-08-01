# frozen_string_literal: true

# These assertions deliberately live in a view spec rather than behind
# render_views in the controller spec: the application layout calls
# javascript_include_tag, and the Run tests workflow never builds the bundles,
# so anything that renders the layout passes locally and fails on the pull
# request.
RSpec.describe "tags/admin" do
  def translated_tag(name)
    tag = build(:tag)
    %i[ca es en].each { |locale| I18n.with_locale(locale) { tag.name = "#{name} #{locale}" } }
    tag.save!
    tag
  end

  it "renders a rename form for every tag" do
    tag = create(:tag, name: "escultura")
    assign(:categories, [tag])

    render

    expect(rendered).to include %(class="simple_form edit_tag" id="edit_tag_#{tag.id}")
  end

  it "points the rename form at the tag" do
    assign(:categories, [create(:tag, name: "escultura")])

    render

    expect(rendered).to include %(action="/ca/tags/escultura")
  end

  it "renders an input per locale" do
    assign(:categories, [create(:tag, name: "escultura")])

    render

    expect(rendered.scan(/name="tag\[name\]\[\w+\]"/).sort)
      .to eq ['name="tag[name][ca]"', 'name="tag[name][en]"', 'name="tag[name][es]"']
  end

  it "submits the rename form as a normal request rather than over ajax" do
    assign(:categories, [create(:tag, name: "escultura")])

    render

    expect(rendered).not_to include "data-remote"
  end

  it "points the delete button at the tag" do
    assign(:categories, [create(:tag, name: "escultura")])

    render

    expect(rendered).to include %(<form class="button_to" method="post" action="/ca/tags/escultura")
  end

  it "sends the delete button as a DELETE request without relying on javascript" do
    assign(:categories, [create(:tag, name: "escultura")])

    render

    expect(rendered).to include %(<input type="hidden" name="_method" value="delete")
  end

  it "asks for confirmation before deleting" do
    assign(:categories, [create(:tag, name: "escultura")])

    render

    expect(rendered).to include %(data-confirm="Segur que vols esborrar aquesta etiqueta?")
  end

  it "keeps the delete button out of the rename form" do
    assign(:categories, [create(:tag, name: "escultura")])

    render

    expect(rendered.scan(%r{<form|</form>}).size).to eq 4
  end

  it "flags the tags that are missing a translation" do
    assign(:categories, [create(:tag, name: "escultura")])

    render

    expect(rendered).to include "untranslated_tag"
  end

  it "leaves the fully translated tags unflagged" do
    assign(:categories, [translated_tag("escultura")])

    render

    expect(rendered).not_to include "untranslated_tag"
  end

  it "keeps the rename form on the requested locale" do
    tag = translated_tag("escultura")
    assign(:categories, [tag])

    I18n.with_locale(:es) { render }

    expect(rendered).to include %(action="/es/tags/)
  end

  it "keeps the delete button on the requested locale" do
    assign(:categories, [translated_tag("escultura")])

    I18n.with_locale(:es) { render }

    expect(rendered).to include %(<form class="button_to" method="post" action="/es/tags/)
  end
end
