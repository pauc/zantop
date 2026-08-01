# frozen_string_literal: true

RSpec.describe ActionWorkForm do
  describe "#submit_button_text" do
    it "offers to create a new action work" do
      expect(described_class.new.submit_button_text).to eq "Crear treball d'acció"
    end

    it "offers to update a persisted action work" do
      expect(described_class.new(work: create(:action_work)).submit_button_text)
        .to eq "Actualitzar treball d'acció"
    end
  end

  describe "attributes" do
    it "carries the place" do
      work = create(:action_work, place: "Barcelona")

      expect(described_class.new(work:).place).to eq "Barcelona"
    end

    it "carries the realization date" do
      work = create(:action_work, realization_date: Date.new(1998, 3, 14))

      expect(described_class.new(work:).realization_date).to eq Date.new(1998, 3, 14)
    end

    it "stores the place on submit" do
      described_class.new.submit(title: "Jurimuri", place: "Barcelona")

      expect(ActionWork.last.place).to eq "Barcelona"
    end

    it "stores the realization date on submit" do
      described_class.new.submit(title: "Jurimuri", realization_date: "1998-03-14")

      expect(ActionWork.last.realization_date).to eq Date.new(1998, 3, 14)
    end
  end

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
