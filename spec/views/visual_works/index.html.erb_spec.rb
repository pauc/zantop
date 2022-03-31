# frozen_string_literal: true

require "rails_helper"

RSpec.describe "visual_works/index", type: :view do
  it "displays the header" do
    render

    expect(rendered).to match(/Visual art/)
  end
end
