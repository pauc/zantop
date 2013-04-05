# encoding: utf-8
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "User#{n}"}
    email { "#{name}@email.com" }
    password { "#{name}-secret"}
    password_confirmation { password }
  end

  factory :page do
    sequence(:title) { |n| "Page #{n} title" }
    body { "The body for the page" }
  end

  factory :action_work do
    sequence(:title) {|n| "Action Work #{n}"}
    description { "Description for #{title}" }
    place { "Place for #{title}"}
    published { true }
    sequence(:realization_date) { |n| n.days.from_now }
  end

  factory :visual_work do
    sequence(:title) {|n| "Visual Work #{n}"}
    description { "Description for #{title}" }
    dimensions { "Place for #{title}"}
    techniques { "Techniques for #{title}"}
    published { true }
    sequence(:realization_date) { |n| n.days.from_now }
  end

  factory :image do |f|
    image { fixture_file_upload("#{Rails.root}/spec/images_for_tests/HomoLuxus.jpg") }
    f.association :illustrated, factory: :visual_work
  end

  factory :tag do
    sequence(:name) { |n| "Tag-#{n}" }
  end

  factory :tagging do |f|
    tag
    f.association :taggable, factory: :visual_work
  end

  factory :link do |l|
    sequence(:title) { |n| "Interesting link #{n}" }
    sequence(:url) { |n| "http://example_#{n}.com"}
  end

  factory :section do |s|
    sequence(:title) { |n| "Section #{n}" }
    sequence(:body) { |n| "The text for section #{n}" }
    s.association :content, factory: :visual_work
  end
end
