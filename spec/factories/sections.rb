# frozen_string_literal: true

FactoryBot.define do
  factory :section do
    association :work, factory: :action_work

    sequence(:title) { |n| "Section #{n}" }
    body { "Body for #{title}" }
    sequence(:position) { |n| n }
  end
end
