# frozen_string_literal: true

RSpec.describe WorkForm do
  describe "#initialize" do
    it "builds a new work when none is given" do
      expect(described_class.new).to be_new_record
    end

    it "copies the attributes of a persisted work" do
      work = create(:action_work, title: "El títol", published: true)

      form = described_class.new(work:)

      expect(form.title).to eq "El títol"
      expect(form.published).to be true
    end

    it "copies the description of a persisted work" do
      work = create(:action_work)
      work.update!(description: "La descripció")

      expect(described_class.new(work:).description).to include "La descripció"
    end

    it "leaves the attributes empty for a new work" do
      form = described_class.new(work: ActionWork.new(title: "Not copied"))

      expect(form.title).to be_nil
    end

    it "copies the description as the markup an editor submits" do
      work = create(:action_work)
      work.update!(description: "<p>La <em>descripció</em></p>")

      expect(described_class.new(work: work.reload).description)
        .to eq "<p>La <em>descripció</em></p>"
    end

    it "does not copy the description as rendered content" do
      work = create(:action_work)
      work.update!(description: "<p>La descripció</p>")

      expect(described_class.new(work: work.reload).description).not_to include "trix-content"
    end

    it "leaves a title the locale being edited has not translated empty" do
      work = create(:action_work, title: "El títol")

      expect(I18n.with_locale(:en) { described_class.new(work:).title }).to be_nil
    end

    it "leaves a description the locale being edited has not translated empty" do
      work = create(:action_work)
      work.update!(description: "La descripció")

      expect(I18n.with_locale(:en) { described_class.new(work: work.reload).description })
        .to be_nil
    end

    it "copies what the locale being edited does hold" do
      work = create(:action_work)
      I18n.with_locale(:en) { work.update!(title: "The title") }

      expect(I18n.with_locale(:en) { described_class.new(work: work.reload).title })
        .to eq "The title"
    end

    it "copies an attribute that has one value for every locale whatever the locale" do
      work = create(:action_work, published: true)

      expect(I18n.with_locale(:en) { described_class.new(work:).published }).to be true
    end
  end

  # A blank field in a locale a work is not translated into means "not
  # translated yet". Saving it must leave the work exactly as it was, or the
  # form would empty the work every time the admin corrects a typo on /en.
  describe "submitting a locale left untranslated" do
    it "stores no translation for it" do
      work = create(:action_work, title: "El títol")

      I18n.with_locale(:en) { described_class.new(work:).submit(title: "", description: "") }

      expect(work.reload.translated_into?(:en)).to be false
    end

    it "keeps the text the work already had" do
      work = create(:action_work, title: "El títol")

      I18n.with_locale(:en) { described_class.new(work:).submit(title: "", description: "") }

      expect(work.reload.title).to eq "El títol"
    end

    it "is accepted, since the work keeps the title it has" do
      work = create(:action_work, title: "El títol")

      expect(I18n.with_locale(:en) { described_class.new(work:).submit(title: "") }).to be_truthy
    end

    it "still refuses a new work with no title at all" do
      expect(I18n.with_locale(:en) { described_class.new.submit(title: "") }).to be_falsey
    end

    it "still refuses to blank the title of the default locale" do
      work = create(:action_work, title: "El títol")

      expect(described_class.new(work:).submit(title: "")).to be_falsey
    end

    it "stores no translation for a nested section left untranslated" do
      work = create(:action_work)
      section = create(:section, work:, title: "La secció")

      I18n.with_locale(:en) do
        described_class.new(work: work.reload)
                       .submit(title: "", section_attributes: { section.id.to_s => { title: "" } })
      end

      expect(section.reload.translated_into?(:en)).to be false
    end

    it "keeps a nested section's text when its locale is left untranslated" do
      work = create(:action_work)
      section = create(:section, work:, title: "La secció")

      I18n.with_locale(:en) do
        described_class.new(work: work.reload)
                       .submit(title: "", section_attributes: { section.id.to_s => { title: "" } })
      end

      expect(section.reload.title).to eq "La secció"
    end

    it "stores no translation for a nested image left untranslated" do
      work = create(:action_work)
      image = create(:image, work:, credits: "Foto: Algú")

      I18n.with_locale(:en) do
        described_class.new(work: work.reload)
                       .submit(title: "", image_attributes: { image.id.to_s => { credits: "" } })
      end

      expect(image.reload.translated_into?(:en)).to be false
    end
  end

  describe "#submit" do
    it "creates the work" do
      expect { described_class.new.submit(title: "Jurimuri") }
        .to change(Work, :count)
        .by(1)
    end

    it "returns a truthy value when it succeeds" do
      expect(described_class.new.submit(title: "Jurimuri")).to be_truthy
    end

    it "returns a falsey value when the work is invalid" do
      expect(described_class.new.submit(title: "")).to be_falsey
    end

    it "does not create a work without a title" do
      expect { described_class.new.submit(title: "") }
        .not_to change(Work, :count)
    end

    it "rolls back the sections when the work is invalid" do
      attributes = {
        title: "",
        section_attributes: {
          "999999999999001" => { title: "Section", body: "Body", position: 1 }
        }
      }

      expect { described_class.new.submit(attributes) }.not_to change(Section, :count)
    end

    it "reports failure when the work itself cannot be saved" do
      # "new" is a friendly_id reserved word, so the generated slug is rejected
      expect(described_class.new.submit(title: "New")).to be_falsey
    end

    it "does not create a work whose slug the model rejects" do
      expect { described_class.new.submit(title: "New") }.not_to change(Work, :count)
    end

    it "surfaces the errors of the work on the form" do
      form = described_class.new
      form.submit(title: "New")

      expect(form.errors[:friendly_id]).to be_present
    end

    it "does not persist a rejected update" do
      work = create(:action_work, title: "El títol")

      expect { described_class.new(work:).submit(title: "New") }
        .not_to change { work.reload.title }
    end

    it "stores the description" do
      described_class.new.submit(title: "Jurimuri", description: "La descripció")

      expect(Work.last.description.to_plain_text).to eq "La descripció"
    end

    it "stores the published flag" do
      described_class.new.submit(title: "Jurimuri", published: true)

      expect(Work.last).to be_published
    end

    it "creates the sections given as nested attributes" do
      attributes = {
        title: "Jurimuri",
        section_attributes: {
          "999999999999001" => { title: "Section 1", body: "Body 1", position: 1 },
          "999999999999002" => { title: "Section 2", body: "Body 2", position: 2 }
        }
      }

      expect { described_class.new.submit(attributes) }.to change(Section, :count).by(2)
    end

    it "updates an existing section" do
      work = create(:action_work)
      section = create(:section, work:, title: "Old")

      attributes = {
        title: work.title,
        section_attributes: { section.id.to_s => { title: "New" } }
      }

      expect { described_class.new(work:).submit(attributes) }
        .to change { section.reload.title }
        .from("Old")
        .to("New")
    end

    it "adds a section to a work that already has one" do
      work = create(:action_work)
      create(:section, work:)

      attributes = {
        title: work.title,
        section_attributes: { "999999999999001" => { title: "Nova", body: "Cos", position: 2 } }
      }

      expect { described_class.new(work:).submit(attributes) }
        .to change { work.reload.sections.count }
        .from(1)
        .to(2)
    end

    it "adds an image to a work that already has one" do
      work = create(:action_work)
      create(:image, :video, work:)

      attributes = {
        title: work.title,
        image_attributes: {
          "999999999999001" => { video: "https://vimeo.com/1", position: 2 }
        }
      }

      expect { described_class.new(work:).submit(attributes) }
        .to change { work.reload.images.count }
        .from(1)
        .to(2)
    end

    it "removes sections marked for destruction" do
      work = create(:action_work)
      section = create(:section, work:)

      attributes = {
        title: work.title,
        section_attributes: { section.id.to_s => { _destroy: "true" } }
      }

      expect { described_class.new(work:).submit(attributes) }
        .to change(Section, :count)
        .by(-1)
    end

    it "keeps the sections that are not marked for destruction" do
      work = create(:action_work)
      kept = create(:section, work:)
      removed = create(:section, work:)

      attributes = {
        title: work.title,
        section_attributes: { removed.id.to_s => { _destroy: "true" } }
      }

      described_class.new(work:).submit(attributes)

      expect(work.reload.sections).to eq [kept]
    end

    it "keeps the images that are not marked for destruction" do
      work = create(:action_work)
      kept = create(:image, :video, work:)
      removed = create(:image, :video, work:)

      attributes = {
        title: work.title,
        image_attributes: { removed.id.to_s => { _destroy: "true" } }
      }

      described_class.new(work:).submit(attributes)

      expect(work.reload.images).to eq [kept]
    end

    it "creates the images given as nested attributes" do
      attributes = {
        title: "Jurimuri",
        image_attributes: {
          "999999999999001" => { video: "https://vimeo.com/76979871", position: 1 }
        }
      }

      expect { described_class.new.submit(attributes) }.to change(Image, :count).by(1)
    end

    it "removes images marked for destruction" do
      work = create(:action_work)
      image = create(:image, :video, work:)

      attributes = {
        title: work.title,
        image_attributes: { image.id.to_s => { _destroy: "true" } }
      }

      expect { described_class.new(work:).submit(attributes) }
        .to change(Image, :count)
        .by(-1)
    end

    it "updates an existing image" do
      work = create(:action_work)
      image = create(:image, :video, work:)

      attributes = {
        title: work.title,
        image_attributes: { image.id.to_s => { video: "https://vimeo.com/1" } }
      }

      expect { described_class.new(work:).submit(attributes) }
        .to change { image.reload.video }
        .to("https://vimeo.com/1")
    end

    it "seeds the default locale of a work submitted in another one" do
      I18n.with_locale(:en) { described_class.new.submit(title: "Jurimuri") }

      expect(I18n.with_locale(:ca) { Work.last.title }).to eq "Jurimuri"
    end

    it "seeds the default locale of the sections it creates" do
      attributes = {
        title: "Jurimuri",
        section_attributes: {
          "999999999999001" => { title: "The Section", body: "Body", position: 1 }
        }
      }
      I18n.with_locale(:en) { described_class.new.submit(attributes) }

      expect(I18n.with_locale(:ca) { Section.last.title }).to eq "The Section"
    end

    it "seeds the default locale of the credits of the images it creates" do
      attributes = {
        title: "Jurimuri",
        image_attributes: {
          "999999999999001" => { video: "https://vimeo.com/76979871",
                                 credits: "Photo: Someone",
                                 position: 1 }
        }
      }
      I18n.with_locale(:en) { described_class.new.submit(attributes) }

      expect(I18n.with_locale(:ca) { Image.last.credits }).to eq "Photo: Someone"
    end

    it "replaces the file of an existing image" do
      work = create(:action_work)
      image = create(:image, work:)

      attributes = {
        title: work.title,
        image_attributes: { image.id.to_s => { image: upload("other_image.png") } }
      }

      expect { described_class.new(work:).submit(attributes) }
        .to change { image.reload.image.blob.id }
    end

    it "stores the bytes of the replacing file" do
      work = create(:action_work)
      image = create(:image, work:)

      described_class.new(work:).submit(
        title: work.title,
        image_attributes: { image.id.to_s => { image: upload("other_image.png") } }
      )

      expect(image.reload.image.blob.checksum).to eq checksum_of("other_image.png")
    end

    it "does not save an unchanged section again" do
      work = create(:action_work)
      section = create(:section, work:, title: "Section")

      described_class.new(work:).submit(title: work.title,
                                        section_attributes: {
                                          section.id.to_s => { title: "Section" }
                                        })

      expect(section.reload.title).to eq "Section"
    end
  end

  describe "#tags" do
    it "returns each tag as an id and name pair" do
      tag = create(:tag, name: "escultura")
      work = create(:action_work, tags: [tag])

      expect(described_class.new(work:).tags).to eq [[tag.id, "escultura"]]
    end

    it "is empty for a work without tags" do
      expect(described_class.new.tags).to eq []
    end

    it "preloads the tag name translations" do
      work = create(:action_work, tags: [create(:tag)])
      form = described_class.new(work:)
      form.tags

      expect(work.tags.first.association(:plain_text_translations)).to be_loaded
    end
  end

  describe "#tags=" do
    let(:form) { described_class.new(work: create(:action_work)) }

    it "assigns existing tags by id" do
      tag = create(:tag, name: "escultura")

      expect { form.tags = [tag.id.to_s] }
        .to change(form, :tags)
        .from([])
        .to([[tag.id, "escultura"]])
    end

    it "creates a tag for a name that is not an id" do
      expect { form.tags = ["escultura"] }.to change(Tag, :count).by(1)
    end

    it "assigns the tag it just created" do
      form.tags = ["escultura"]

      expect(form.tags.map(&:last)).to eq ["escultura"]
    end

    it "does not create a tag for an entry that is an id" do
      tag = create(:tag)

      expect { form.tags = [tag.id.to_s] }.not_to change(Tag, :count)
    end

    it "ignores blank entries" do
      expect { form.tags = ["", nil] }.not_to change(Tag, :count)
    end

    it "leaves the work without tags when given only blanks" do
      form.tags = ["", nil]

      expect(form.tags).to eq []
    end

    it "mixes existing ids and new names" do
      tag = create(:tag, name: "escultura")
      form.tags = [tag.id.to_s, "pintura"]

      expect(form.tags.map(&:last)).to contain_exactly("escultura", "pintura")
    end

    it "replaces the tags already on the work" do
      work = create(:action_work, tags: [create(:tag, name: "escultura")])
      other_form = described_class.new(work:)
      other_form.tags = []

      expect(other_form.tags).to eq []
    end

    it "seeds the default locale of a tag created in another one" do
      I18n.with_locale(:en) { form.tags = ["sculpture"] }

      expect(I18n.with_locale(:ca) { Tag.last.name }).to eq "sculpture"
    end

    it "downcases a newly created tag name" do
      form.tags = ["ESCULTURA"]

      expect(form.tags.map(&:last)).to eq ["escultura"]
    end
  end

  describe "#tag_options" do
    it "returns every tag as an id and name pair" do
      tag = create(:tag, name: "escultura")

      expect(described_class.new.tag_options).to eq [[tag.id, "escultura"]]
    end

    it "includes tags that are not on the work" do
      create(:tag, name: "escultura")
      create(:tag, name: "pintura")

      expect(described_class.new.tag_options.map(&:last))
        .to contain_exactly("escultura", "pintura")
    end

    it "is empty when there are no tags" do
      expect(described_class.new.tag_options).to eq []
    end
  end

  describe "#section_attributes=" do
    it "builds a section for an id above the new record threshold" do
      form = described_class.new

      expect { form.section_attributes = { "999999999999001" => { title: "New" } } }
        .to change { form.sections.size }
        .by(1)
    end

    it "builds every new section in the same call" do
      form = described_class.new

      expect {
        form.section_attributes = {
          "999999999999001" => { title: "First" },
          "999999999999002" => { title: "Second" }
        }
      }.to change { form.sections.size }.by(2)
    end

    it "picks the section whose id matches" do
      work = create(:action_work)
      create(:section, work:, title: "First")
      second = create(:section, work:, title: "Second")
      form = described_class.new(work:)

      form.section_attributes = { second.id.to_s => { title: "Changed" } }

      expect(form.sections.map(&:title)).to eq %w[First Changed]
    end

    it "does not assign attributes to a section it is destroying" do
      work = create(:action_work)
      section = create(:section, work:, title: "Old")
      form = described_class.new(work:)

      form.section_attributes = { section.id.to_s => { _destroy: "true", title: "New" } }

      expect(form.sections.first.title).to eq "Old"
    end

    it "does not treat the threshold itself as a new record" do
      form = described_class.new

      expect { form.section_attributes = { "999999999999000" => { title: "New" } } }
        .to raise_error(NoMethodError)
    end

    it "assigns attributes to an existing section" do
      work = create(:action_work)
      section = create(:section, work:, title: "Old")
      form = described_class.new(work:)

      form.section_attributes = { section.id.to_s => { title: "New" } }

      expect(form.sections.first.title).to eq "New"
    end

    it "marks a section for destruction" do
      work = create(:action_work)
      section = create(:section, work:)
      form = described_class.new(work:)

      form.section_attributes = { section.id.to_s => { _destroy: "true" } }

      expect(form.sections.first).to be_marked_for_destruction
    end

    it "does not mark a section whose _destroy flag is false" do
      work = create(:action_work)
      section = create(:section, work:)
      form = described_class.new(work:)

      form.section_attributes = { section.id.to_s => { _destroy: "false", title: "New" } }

      expect(form.sections.first).not_to be_marked_for_destruction
    end

    it "assigns the remaining attributes when _destroy is false" do
      work = create(:action_work)
      section = create(:section, work:, title: "Old")
      form = described_class.new(work:)

      form.section_attributes = { section.id.to_s => { _destroy: "false", title: "New" } }

      expect(form.sections.first.title).to eq "New"
    end

    it "accepts an integer id" do
      work = create(:action_work)
      section = create(:section, work:, title: "Old")
      form = described_class.new(work:)

      form.section_attributes = { section.id => { title: "New" } }

      expect(form.sections.first.title).to eq "New"
    end
  end

  describe "#image_attributes=" do
    it "builds an image for an id above the new record threshold" do
      form = described_class.new

      expect { form.image_attributes = { "999999999999001" => { video: "https://v.co/1" } } }
        .to change { form.images.size }
        .by(1)
    end

    it "marks an image for destruction" do
      work = create(:action_work)
      image = create(:image, :video, work:)
      form = described_class.new(work:)

      form.image_attributes = { image.id.to_s => { _destroy: "true" } }

      expect(form.images.first).to be_marked_for_destruction
    end
  end

  describe "#submit_button_text" do
    it "is a generic label" do
      expect(described_class.new.submit_button_text).to eq "Guardar"
    end
  end

  describe "validations" do
    it "requires a title" do
      form = described_class.new
      form.title = ""

      expect(form).not_to be_valid
    end

    it "accepts a title" do
      form = described_class.new
      form.title = "Jurimuri"

      expect(form).to be_valid
    end
  end

  describe "delegation" do
    it "delegates the id to the work" do
      work = create(:action_work)

      expect(described_class.new(work:).id).to eq work.id
    end

    it "delegates new_record? to the work" do
      expect(described_class.new(work: create(:action_work))).not_to be_new_record
    end

    it "delegates the sections to the work" do
      work = create(:action_work)
      section = create(:section, work:)

      expect(described_class.new(work:).sections).to eq [section]
    end

    it "delegates the images to the work" do
      work = create(:action_work)
      image = create(:image, :video, work:)

      expect(described_class.new(work:).images).to eq [image]
    end
  end
end
