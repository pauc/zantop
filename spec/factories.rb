# encoding: utf-8

FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "User#{n}"}
    email { "#{name}@email.com" }
    password { "#{name}-secret"}
    password_confirmation { password }
  end

  factory :work do
    sequence(:title) { |n| "Work#{n}" }
    description { "description for #{title}" }
    type { "no_type" }
    sequence(:realized) { |n| n.days.ago }
    where { "Place for #{title}" } 
  end

  factory :action_work do
    sequence(:title) { |n| "ActionWork#{n}" }
    description { "description for #{title}" }
    sequence(:realized) { |n| n.days.ago }
    where { "Place for #{title}" } 
  end

  factory :visual_work do
    sequence(:title) { |n| "VisualWork#{n}" }
    description { "description for #{title}" }
    sequence(:realized) { |n| n.days.ago }
    where { "Place for #{title}" } 
  end
end