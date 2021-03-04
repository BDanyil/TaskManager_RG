# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    content { 'MyString' }
    projects { nil }
  end
end
