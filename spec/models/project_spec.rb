# frozen_string_literal: true

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:tasks) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(140) }
  end
end
