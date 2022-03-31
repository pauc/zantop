# frozen_string_literal: true

require "rails_helper"

RSpec.describe "action_works/index", type: :view do
  xit "displays the header" do
    render

    expect(rendered).to match("Art d&#39;acció")
  end
end
