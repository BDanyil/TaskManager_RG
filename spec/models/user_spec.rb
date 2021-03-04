# frozen_string_literal: true

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_confirmation_of(:password) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'validations' do
    it { should have_many(:tasks).through(:projects) }
    it { should have_many(:projects) }
  end
end
