require 'rails_helper'

RSpec.describe BookEntry, type: :model do
  subject {
    described_class.new(
      user: create(:user),
      kind: 1
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a kind" do
    subject.kind = nil
    expect(subject).to_not be_valid
  end

  describe 'associations' do
    subject { described_class.new }

    it { is_expected.to belong_to(:user) }
  end

  describe 'constraints' do
    subject { described_class.new }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:kind) }    
  end
end
