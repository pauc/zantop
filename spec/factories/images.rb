# frozen_string_literal: true

FactoryBot.define do
  factory :image do
    association :work, factory: :action_work

    transient do
      attach_image { true }
      filename { "test_image.png" }
    end

    after :build do |image, evaluator|
      next unless evaluator.attach_image

      image.image.attach(io: Rails.root.join("spec/fixtures/files", evaluator.filename).open,
                         filename: evaluator.filename,
                         content_type: "image/png")
    end

    trait :video do
      attach_image { false }
      video { "https://vimeo.com/76979871" }
    end

    trait :empty do
      attach_image { false }
    end
  end
end
