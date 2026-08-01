# frozen_string_literal: true

# The partial used to post to `:action_works` whatever it was given, so a visual
# work could only ever be handed to the wrong controller as a create.
RSpec.describe "visual_works/_form", type: :view do
  def render_form(work_form)
    # The nested field partials live in `app/views/application`, a prefix a real
    # controller inherits from ApplicationController but a view spec does not.
    view.lookup_context.prefixes << "application"

    render partial: "visual_works/form", locals: { work_form: }

    rendered
  end

  it "creates a new work through the visual works route" do
    expect(render_form(VisualWorkForm.new))
      .to include %(action="#{visual_works_path}")
  end

  it "posts a new work, with no verb of its own to override" do
    expect(render_form(VisualWorkForm.new)).not_to include %(name="_method")
  end

  it "updates a persisted work through its own route" do
    work = create(:visual_work)

    expect(render_form(VisualWorkForm.new(work:)))
      .to include %(action="#{visual_work_path(work.id)}")
  end

  it "puts a persisted work, since a form cannot issue the verb itself" do
    work = create(:visual_work)

    expect(render_form(VisualWorkForm.new(work:)))
      .to include %(name="_method" value="put")
  end

  it "offers the tags the controller permits" do
    create(:tag, name: "escultura")

    expect(render_form(VisualWorkForm.new)).to include "escultura"
  end
end
