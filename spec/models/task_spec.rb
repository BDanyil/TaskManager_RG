# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(140) }
  end

  describe 'associations' do
    it { should belong_to(:project) }
  end
end
