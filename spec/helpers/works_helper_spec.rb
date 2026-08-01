# frozen_string_literal: true

RSpec.describe WorksHelper do
  describe "#default_image_for_works" do
    it "renders the placeholder image" do
      expect(helper.default_image_for_works).to include "mz-comodin"
    end

    it "renders an img tag" do
      expect(helper.default_image_for_works).to start_with "<img"
    end
  end

  describe "#print_work_place" do
    it "wraps the place of an action work" do
      work = create(:action_work, place: "Barcelona")

      expect(helper.print_work_place(work))
        .to eq "<div class='work-place'><p>Barcelona</p></div>"
    end

    it "is nil when the place is blank" do
      expect(helper.print_work_place(create(:action_work, place: ""))).to be_nil
    end

    it "is nil when the place is missing" do
      expect(helper.print_work_place(create(:action_work, place: nil))).to be_nil
    end

    it "is nil for an object with no place at all" do
      expect(helper.print_work_place(Object.new)).to be_nil
    end

    it "returns html safe output" do
      work = create(:action_work, place: "Barcelona")

      expect(helper.print_work_place(work)).to be_html_safe
    end
  end

  describe "#print_work_date" do
    it "formats the date of an action work in full" do
      work = create(:action_work, realization_date: Date.new(1998, 3, 14))

      expect(helper.print_work_date(work))
        .to eq "<div class='work-date'><p>#{I18n.l(Date.new(1998, 3, 14))}</p></div>"
    end

    it "prints only the year for a visual work" do
      work = create(:visual_work, realization_date: Date.new(1998, 3, 14))

      expect(helper.print_work_date(work)).to eq "<div class='work-date'><p>1998</p></div>"
    end

    it "is nil without a realization date" do
      expect(helper.print_work_date(create(:action_work, realization_date: nil))).to be_nil
    end

    it "is nil for an object with no realization date at all" do
      expect(helper.print_work_date(Object.new)).to be_nil
    end

    it "is nil for a work that is neither an action nor a visual work" do
      work = Work.create!(title: "Plain", realization_date: Date.new(1998, 3, 14))

      expect(helper.print_work_date(work)).to be_nil
    end

    it "returns html safe output" do
      work = create(:action_work, realization_date: Date.new(1998, 3, 14))

      expect(helper.print_work_date(work)).to be_html_safe
    end
  end

  describe "#print_work_description" do
    it "wraps the description" do
      work = create(:action_work)
      work.update!(description: "La descripció")

      expect(helper.print_work_description(work))
        .to eq "<div class='work-description'>La descripció\n</div>"
    end

    it "is nil when the description is blank" do
      work = create(:action_work)
      work.update!(description: "")

      expect(helper.print_work_description(work)).to be_nil
    end

    it "is nil for an object with no description at all" do
      expect(helper.print_work_description(Object.new)).to be_nil
    end

    it "returns html safe output" do
      work = create(:action_work)
      work.update!(description: "La descripció")

      expect(helper.print_work_description(work)).to be_html_safe
    end
  end

  describe "#print_work_truncated_description" do
    let(:long_work) do
      create(:action_work).tap do |work|
        work.update!(description: (1..50).map { |n| "word#{n}" }.join(" "))
      end
    end

    it "keeps the words up to the limit" do
      expect(helper.print_work_truncated_description(long_work)).to include "word35"
    end

    it "leaves out the words past the limit" do
      expect(helper.print_work_truncated_description(long_work)).not_to include "word36"
    end

    it "leaves a short description untouched" do
      work = create(:action_work)
      work.update!(description: "Curta")

      expect(helper.print_work_truncated_description(work))
        .to eq "<div class='work-description'>Curta\n</div>"
    end

    it "is nil when the description is blank" do
      work = create(:action_work)
      work.update!(description: "")

      expect(helper.print_work_truncated_description(work)).to be_nil
    end

    it "is nil for an object with no description at all" do
      expect(helper.print_work_truncated_description(Object.new)).to be_nil
    end

    it "returns html safe output" do
      expect(helper.print_work_truncated_description(long_work)).to be_html_safe
    end
  end

  describe "#print_work_field" do
    it "prints the label and the value" do
      work = create(:visual_work, techniques: "oli sobre tela")

      expect(helper.print_work_field(work, :techniques))
        .to eq "<div class='work-techniques'>" \
               "<p><strong>#{I18n.t('works.labels.techniques')}:</strong> oli sobre tela</p>" \
               "</div>"
    end

    it "names the div after the field" do
      work = create(:visual_work, dimensions: "10x20")

      expect(helper.print_work_field(work, :dimensions))
        .to start_with "<div class='work-dimensions'>"
    end

    it "is nil when the field is blank" do
      expect(helper.print_work_field(create(:visual_work, techniques: ""), :techniques)).to be_nil
    end

    it "is nil when the work does not respond to the field" do
      expect(helper.print_work_field(create(:action_work), :no_such_field)).to be_nil
    end

    it "returns html safe output" do
      work = create(:visual_work, techniques: "oli sobre tela")

      expect(helper.print_work_field(work, :techniques)).to be_html_safe
    end
  end

  describe "#print_work_tags" do
    it "links the only tag" do
      tag = create(:tag, name: "escultura")
      work = create(:action_work, tags: [tag])

      expect(helper.print_work_tags(work))
        .to eq "<div class='work-tags'>#{I18n.t('categories')}: " \
               "<a href=\"#{helper.tag_path(tag)}\">escultura</a></div>"
    end

    it "separates several tags with a comma" do
      work = create(:action_work, tags: [create(:tag, name: "a1"), create(:tag, name: "b2")])

      expect(helper.print_work_tags(work)).to include "</a>, <a"
    end

    it "is nil when the work has no tags" do
      expect(helper.print_work_tags(create(:action_work))).to be_nil
    end

    it "returns html safe output" do
      work = create(:action_work, tags: [create(:tag)])

      expect(helper.print_work_tags(work)).to be_html_safe
    end
  end

  describe "#url_for_edit_work" do
    it "points at the action work edit page" do
      work = create(:action_work)

      expect(helper.url_for_edit_work(work)).to eq edit_action_work_path(work)
    end

    it "points at the visual work edit page" do
      work = create(:visual_work)

      expect(helper.url_for_edit_work(work)).to eq edit_visual_work_path(work)
    end
  end
end
