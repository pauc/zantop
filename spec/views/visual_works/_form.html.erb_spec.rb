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

  # Whatever a box shows is what saving stores, so a box may only ever show
  # what its own locale holds — see config/initializers/translated_inputs.rb.
  describe "a locale the work is not translated into" do
    it "leaves the title empty rather than pre-filling it from the fallback" do
      work = create(:visual_work, title: "El títol")

      rendered = I18n.with_locale(:en) { render_form(VisualWorkForm.new(work:)) }

      expect(rendered).not_to include %(value="El títol")
    end

    it "offers the default locale's title to translate from" do
      work = create(:visual_work, title: "El títol")

      rendered = I18n.with_locale(:en) { render_form(VisualWorkForm.new(work:)) }

      expect(rendered).to include "Not translated. In Catalan it says:\nEl títol"
    end

    it "leaves the description empty" do
      work = create(:visual_work)
      work.update!(description: "<p>La descripció</p>")

      rendered = I18n.with_locale(:en) { render_form(VisualWorkForm.new(work: work.reload)) }

      expect(rendered).not_to include %(value="&lt;p&gt;La descripció&lt;/p&gt;")
    end

    it "offers the default locale's description as plain text" do
      work = create(:visual_work)
      work.update!(description: "<p>La <strong>descripció</strong></p>")

      rendered = I18n.with_locale(:en) { render_form(VisualWorkForm.new(work: work.reload)) }

      expect(rendered).to include "Not translated. In Catalan it says:\nLa descripció"
    end

    it "leaves a nested section's title empty" do
      work = create(:visual_work)
      create(:section, work:, title: "El títol de la secció")

      rendered = I18n.with_locale(:en) { render_form(VisualWorkForm.new(work: work.reload)) }

      expect(rendered).not_to include %(value="El títol de la secció")
    end

    it "offers the default locale's section title to translate from" do
      work = create(:visual_work)
      create(:section, work:, title: "El títol de la secció")

      rendered = I18n.with_locale(:en) { render_form(VisualWorkForm.new(work: work.reload)) }

      expect(rendered).to include "Not translated. In Catalan it says:\nEl títol de la secció"
    end

    it "leaves a nested image's credits empty" do
      work = create(:visual_work)
      create(:image, work:, credits: "Foto: Algú")

      rendered = I18n.with_locale(:en) { render_form(VisualWorkForm.new(work: work.reload)) }

      expect(rendered).not_to include "Foto: Algú</textarea>"
    end

    it "offers the default locale's credits to translate from" do
      work = create(:visual_work)
      create(:image, work:, credits: "Foto: Algú")

      rendered = I18n.with_locale(:en) { render_form(VisualWorkForm.new(work: work.reload)) }

      expect(rendered).to include "Not translated. In Catalan it says:\nFoto: Algú"
    end

    it "still fills a field the locale does hold" do
      work = create(:visual_work)
      I18n.with_locale(:en) { work.update!(title: "The title") }

      rendered = I18n.with_locale(:en) { render_form(VisualWorkForm.new(work: work.reload)) }

      expect(rendered).to include %(value="The title")
    end

    # Trix's editor is form-associated, so a required section body the locale
    # has not translated made the browser refuse to submit the whole work.
    it "requires nothing of a nested section, whose body the model does require" do
      work = create(:visual_work)
      create(:section, work:)

      rendered = I18n.with_locale(:en) { render_form(VisualWorkForm.new(work: work.reload)) }

      expect(rendered).not_to include %(required="required")
    end

    it "does not require a title the work already has in the default locale" do
      work = create(:visual_work, title: "El títol")

      rendered = I18n.with_locale(:en) { render_form(VisualWorkForm.new(work:)) }

      expect(rendered).not_to include %(required="required")
    end

    it "says nothing about a field the locale does hold" do
      work = create(:visual_work)
      I18n.with_locale(:en) { work.update!(title: "The title") }

      rendered = I18n.with_locale(:en) { render_form(VisualWorkForm.new(work: work.reload)) }

      expect(rendered).not_to include "Not translated. In Catalan it says:\nThe title"
    end
  end

  it "says nothing about translations on the default locale" do
    work = create(:visual_work, title: "El títol")

    expect(render_form(VisualWorkForm.new(work:))).not_to include "Sense traduir"
  end

  it "still requires a title in the locale that has to have one" do
    expect(render_form(VisualWorkForm.new)).to include %(<abbr title="obligatori">*</abbr> Títol:)
  end

  it "still requires a section's body in the locale that has to have one" do
    work = create(:visual_work)
    create(:section, work:)

    expect(render_form(VisualWorkForm.new(work: work.reload)))
      .to include %(<abbr title="obligatori">*</abbr> Text:)
  end
end
