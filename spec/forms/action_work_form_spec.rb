# frozen_string_literal: true

RSpec.describe ActionWorkForm do
  describe "#initialize" do
    it "gets the values of the work" do
      work = create(:action_work, title: "Some work")

      form = described_class.new(work:)

      expect(form.title).to eq "Some work"
    end
  end

  describe "#submit" do
    it "creates a new work" do
      attributes = { title: "Jurimuri", description: "Buasca muasca" }

      expect { described_class.new.submit(attributes) }
        .to change(ActionWork, :count)
        .by(1)
    end

    it "creates nested sections" do
      attributes = {
        title: "Jurimuri",
        description: "Mosca tosca jurimuri exception mujurri totolaine ...",
        section_attributes: {
          "999999999999001" => {
            title: "Section 1",
            body: "Body for section 1",
            position: 1
          },
          "999999999999002" => {
            title: "Section 2",
            body: "Body for section 2",
            position: 2
          }
        }
      }

      expect { described_class.new.submit(attributes) }
        .to change(Section, :count)
        .by(2)
    end

    it "updates sections" do
      work = create(:action_work)

      section1 = Section.create!(
        work_id: work.id,
        title: "Section 1",
        body: "Body for section 1",
        position: 1
      )
      section2 = Section.create!(
        work_id: work.id,
        title: "Section 2",
        body: "Body for section 2",
        position: 2
      )

      attributes = {
        title: work.title,
        section_attributes: {
          section1.id.to_s => {
            title: "The first section",
            body: "Body for section 1",
            position: 1
          },
          section2.id.to_s => {
            title: "The second section",
            body: "Body for section 2",
            position: 2
          }
        }
      }

      expect { described_class.new(work:).submit(attributes) }
        .to change { section1.reload.title }
        .from("Section 1")
        .to("The first section")
        .and change { section2.reload.title }
        .from("Section 2")
        .to("The second section")
    end

    it "removes sections" do
      work = create(:action_work)

      section1 = Section.create!(
        work_id: work.id,
        title: "Section 1",
        body: "Body for section 1",
        position: 1
      )
      section2 = Section.create!(
        work_id: work.id,
        title: "Section 2",
        body: "Body for section 2",
        position: 2
      )

      attributes = {
        title: work.title,
        section_attributes: {
          section1.id.to_s => {
            _destroy: "true"
          },
          section2.id.to_s => {
            title: "The second section",
            body: "Body for section 2",
            position: 2
          }
        }
      }

      expect { described_class.new(work:).submit(attributes) }
        .to change(work.sections, :count)
        .by(-1)
    end

    it "updates a work" do
      work = create(:action_work, title: "The Work", published: false)

      form_attributes = { title: "Some stuff", published: true }

      expect { described_class.new(work:).submit(form_attributes) }
        .to change(work, :title)
        .from("The Work")
        .to("Some stuff")
        .and change(work, :published?)
        .from(false)
        .to(true)
    end

    it "creates tags" do
      work = create(:action_work, title: "The Work")

      form_attributes = { title: "The Work", tags: ["hola bon dia", "sandungueira"] }

      expect { described_class.new(work:).submit(form_attributes) }
        .to change(Tag, :count)
        .by(2)
    end
  end
end
