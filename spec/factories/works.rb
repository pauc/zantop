# frozen_string_literal: true

FactoryBot.define do
  factory :action_work do
    sequence(:title) { |n| "Action Work #{n}" }
    description { "Description for #{title}" }
    place { "Place for #{title}" }
    published { true }
    sequence(:realization_date) { |n| n.days.from_now }
  end

  factory :visual_work do
    sequence(:title) { |n| "Visual Work #{n}" }
    description { "Description for #{title}" }
    dimensions { "Place for #{title}" }
    techniques { "Techniques for #{title}" }
    published { true }
    sequence(:realization_date) { |n| n.days.from_now }
  end
end
