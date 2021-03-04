# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    title { FFaker::Lorem.word }
    user { create(:user) }
  end
end
