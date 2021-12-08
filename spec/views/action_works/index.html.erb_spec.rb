require "rails_helper"

RSpec.describe "action_works/index", type: :view do
  it "displays the header" do
    render

    expect(rendered).to match /Action art/
  end
end
