# frozen_string_literal: true

# There are only ever two pages and they are found by id, so the factory
# builds the About page by default and the Contact page through the trait.
FactoryBot.define do
  factory :page do
    id { Page::ABOUT_ID }
    title { "About" }
    body { "<p>Mireia Zantop zigzags in the polyhedral unit.</p>" }

    trait :contact do
      id { Page::CONTACT_ID }
      title { "Contact" }
      body { "<p>hola@mireiazantop.com</p>" }
    end
  end
end
