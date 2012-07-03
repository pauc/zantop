# encoding: utf-8

FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "User#{n}"}
    email { "#{name}@email.com" }
    password { "#{name}-secret"}
    password_confirmation { password }
  end

  factory :action_work do
    sequence(:title) {|n| "Action Work #{n}"}
    description { "Description for #{title}" }
    place { "Place for #{title}"}
    sequence(:realization_date) { |n| n.days.from_now }
  end

  factory :visual_work do
    sequence(:title) {|n| "Visual Work #{n}"}
    description { "Description for #{title}" }
    dimensions { "Place for #{title}"}
    techniques { "Techniques for #{title}"}
    sequence(:realization_date) { |n| n.days.from_now }
  end

  factory :image do |f|
    image { "route/to/image" }
    f.association :illustrated, factory: :visual_work
  end
end